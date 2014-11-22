class View
  attr_reader :input, :output, :projects_with_tasks

  def initialize(input, output, projects_with_tasks)
    @input = input
    @output = output
    @projects_with_tasks = projects_with_tasks
  end

  def puts(message)
    output.puts(message)
  end

  def print_project_menu
    puts "Welcome "
    puts "'list' to list projects "
    puts "'create' to create a new project "
    puts "'edit' to edit a project "
    puts "'rename' to rename a project "
    puts "'delete' to rename a project "
  end

  def print_task_menu(projects)
    puts "Editing Project: #{projects} "
    puts "'list' to list tasks "
    puts "'create' to create a new task "
    puts "'edit' to edit a task "
    puts "'complete' to complete a task and remove it from the list "
  end

  def task_lister(project)
    if @projects_with_tasks[project] == []
      puts '  none'
    else
      task_list = @projects_with_tasks[project].join(", ")
      puts task_list
    end
  end

  def print_projects(projects)
    if projects == {}
      puts "Projects:\n  none"
    else
      puts "Projects:\n  " + projects.keys.join(", ")
    end
  end

  def edit_projects_tasks_prompt
    puts "Which project would you like to edit?\n"
  end

  def create_project_projects_prompt
    puts "Please enter the new project name:\n"
  end

  def delete_project_projects_prompt
    puts "Please enter the project name to delete:\n"
  end

  def rename_project_projects_prompt
    puts "Please enter the project name to rename:\n"
  end

  def new_name_projects_prompt
    puts "Please enter the new project name:\n"
  end

  def create_task_tasks_prompt
    puts "Please enter the task you would like to add."
  end

  def edit_task_tasks_prompt
    puts "Please enter the task you would like to edit."
  end

  def new_task_name_tasks_prompt
    puts "Please enter the new task name:\n"
  end

  def task_not_found_tasks_prompt
    puts "task not found: 'not here'"
  end

  def task_completed_tasks_prompt(project)
    puts "Which task have you completed?"
    puts "  #{task_lister(project)}"
  end

end
