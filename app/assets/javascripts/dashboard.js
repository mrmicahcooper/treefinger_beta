$(function(){
  var dashboard = {
      init: function(){
        this.initTasks();
      },
      initTasks: function(){
        $('#task_list ul li').click(this.showInTasksForm);
        $('.task_form form input[type="reset"]').click(this.clearSelectedTasks)
        $("body").delegate('input.edit_task_name','blur', this.editTaskName);
        $('li a.complete').click(this.completeTask);
        $('li a.delete').click(this.deleteTask);
        $('li a.edit').click(this.editTask);
      },
      completeTask: function(e){
        e.stopPropagation();
        var t = $(this).closest('li');
        $.ajax('', {
          data: null,
          success: function(){
            t.hide('400', function(){
              $(this).remove();
              dashboard.showInTasksForm();
            }
            );
        }});
      },
      deleteTask: function(e){
        e.stopPropagation();
        var t = $(this).closest('li');
        $.ajax('', {
          data: null,
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
        //get just the name and description from the task and put that in
        //there.
        var t =  $(this)
        t.toggleClass('selected');
        $('#task_form').val(dashboard.selectedTasks());
      },
      selectedTasks: function(){
          return $('#task_list ul li.selected').map(function(){
            return $(this).data('task');
          }).get().join('\n---\n\n');
      },
      clearSelectedTasks: function(){
        return $('#task_list ul li.selected').map(function(){
          return $(this).removeClass('selected');
        })
      }
    };
  dashboard.init();
});
