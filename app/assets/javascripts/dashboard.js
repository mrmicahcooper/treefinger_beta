$(function(){
  var dashboard = {
      init: function(){
        $('#task_list ul li').click(this.showInTasksForm);
        $('#task_form form input[type="reset"]').click(this.resetTaskForm)
        $("body").delegate('input.edit_task_name','blur', this.editTaskName);
        $('li a.complete').bind('click', this.completeTask);
        $('li a.delete').bind('click', this.deleteTask);
        $('li a.edit').click(this.editTask);
        $('#projects').bind('keyup.placeholder', this.togglePlaceholder)
      },
      togglePlaceholder: function(){
        var e = $(this);
        if (e.val().trim() == ""){
          $('pre.placeholder').show();
          e.val('');
        }
        else{
          $('pre.placeholder').hide();
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
      editTask: function(e){
        var task = $(this).closest('li'),
            t = task.find('.task_name'),
            task_name = t.text();
        task.data('task_name', task_name);
        t.replaceWith('<input class="edit_task_name" value="'+task_name+'" />')
        task.find('input').focus();
        if (task.hasClass('selected')){
          e.stopPropagation();
        }
      },
      editTaskName: function(){
        var t = $(this),
            task = t.closest('li'),
            new_task_name = t.val(),
            old_task_name = task.data("task_name");
            task.data("task_name", new_task_name)
        t.replaceWith('<strong class="task_name">'+new_task_name+'</strong>');
        if (old_task_name != new_task_name){
          $.ajax(
            '',
            {
              task_id: 'some id',
              name: new_task_name
            }//Get task id for this
          );
        }
      },
      showInTasksForm: function(){
        $('pre.placeholder').hide();
        var t =  $(this)
        t.toggleClass('selected');
        $('#task_form textarea').val(dashboard.selectedTasks());
      },
      selectedTasks: function(){
        return dashboard.currentProjectName + $('#task_list ul li.selected').map(function(){
          var t = $(this);
          if (t.data("task_description") == "" ) {
            return (t.data("task_name") + "\n");
          }else{
            return ("\n" + t.data("task_name") + "\n" + t.data("task_description") + "\n");
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
        $('pre.placeholder').show();
      },
      currentProjectName: "! " +  $('nav.projects a.active').text() + '\n\n'
    };
  dashboard.init();
});
