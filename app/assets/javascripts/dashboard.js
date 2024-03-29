$(function(){
  var dashboard = {
      init: function(){
        $('#task_list ul li').click(this.showInTasksForm);
        $('#task_form form input[type="reset"]').click(this.resetTaskForm)
        $('li a.complete').bind('click', this.completeTask);
        $('li a.delete').bind('click', this.deleteTask);
        $('#projects').bind('keydown.intent', this.autoIndent);
        $('#projects').focus();
      },
      mainSectionHeight: $(window).height() - $('header').height() - 5,
      textareaHeight: $(window).height() - $('header').height() - 75,
      autoIndent: function(e){
        var t = $(this);
        if (e.keyCode === 13){
           var caret = t[0].selectionStart,
           projectString = t.val(),
           stringBeforeCaret = projectString.slice(0, caret);
           stringAfterCaret = projectString.slice(caret);

           previousLineStartLocation = function(){
             for (x = caret; x >= 0; x--) {
               if (stringBeforeCaret[x] == "\n"){ return x + 1 }
               else if( x == 0) { return x }
             }
           }

           previousLine = projectString.slice(previousLineStartLocation(), caret);
           spaces = previousLine.match(/^[ ]*/)[0];
           spacesLength = spaces.length;
           if (spacesLength > 0 && $.trim(previousLine) != ""){
             newProjectString = (stringBeforeCaret +"\n" + spaces) + stringAfterCaret;
             newCaret = caret + spacesLength + 1;
             t.val(newProjectString).get(0).setSelectionRange(newCaret,newCaret)
             return false;
           }
        }
      },
      completeTask: function(e){
        e.preventDefault();
        e.stopPropagation();
        var currentLink = $(this), t = currentLink.closest('li');
        $.ajax(currentLink.attr('href'), {
          type: 'PUT',
          success: function(){
            t.hide('400', function(){
              $(this).remove();
              dashboard.showInTasksForm();
            }
            );
        }});
      },
      deleteTask: function(e){
        e.preventDefault();
        e.stopPropagation();
        var currentLink = $(this), t = currentLink.closest('li');
        $.ajax(currentLink.attr('href'), {
          type: 'DELETE',
          success: function(){
            t.hide('400', function(){
              $(this).remove();
              dashboard.showInTasksForm();
            }
            );
        }});
      },
      showInTasksForm: function(){
        var t =  $(this)
        t.toggleClass('selected');
        $('#task_form textarea').val(dashboard.selectedTasks());
      },
      //TODO Refactor this uglyassjavascript
      selectedTasks: function(){
        var $line_breaks = ""
        return dashboard.currentProjectName + $('#task_list ul li.selected').map(function(i){
          var t = $(this), task_string = "";
          if (t.data("task_description") == "" ) {// if it's just a task (no description)
            if ($line_breaks == "\n\n"){// if the last line task had a description
              task_string = "\n" + t.data("task_name"); //Add an extra break after the task with the description
            }else{
              task_string = t.data("task_name");
            }
            $line_breaks = "\n";
          }else {
            $line_breaks = "\n\n";
            task_string = t.data("task_name") + "\n" + t.data("task_description");
          }
          if (i == 0){// if it's the first task, don't add the line breaks
            return (task_string);
          }else{
            return ($line_breaks + task_string);
          }
        }).get().join('');
      },
      clearSelectedTasks: function(){
         $('#task_list ul li.selected').map(function(){
           $(this).removeClass('selected');
        })
      },
      resetTaskForm: function(){
        dashboard.clearSelectedTasks();
      },
      currentProjectName: "! " +  $('nav.projects a.active').text() + '\n\n'
    };
  dashboard.init();
});
