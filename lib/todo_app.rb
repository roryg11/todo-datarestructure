class TodoApp < CommandLineApp
  attr_accessor :input, :output, :projects_with_tasks

  def initialize(input, output)
    @input = input
    @output = output
    @projects_with_tasks = {}
  end

  def run

    welcome_menu = true

    while welcome_menu
      print_project_menu
      user_input = gets.chomp
      if user_input == 'list'
        puts "Projects:\n  #{print_projects} "
      elsif user_input == 'create'
        create_project_projects_prompt
        create_project = gets.chomp
        add_project(create_project)
      elsif user_input == 'delete'
        delete_project_projects_prompt
        desired_project_to_delete = gets.chomp
        remove_project(desired_project_to_delete)
      elsif user_input == 'rename'
        rename_project_projects_prompt
        project_to_rename = gets.chomp
        project_rename(project_to_rename)
      elsif user_input == 'edit'
        task_menu
      elsif user_input == 'quit'
        welcome_menu = false
      end
    end
  end

  def task_menu

    edit_projects_tasks_prompt
    project = gets.chomp

    task_menu = true
    while task_menu

      if @projects_with_tasks.has_key?(project)
        print_task_menu
      end

      task_input = gets.chomp
      if task_input == 'list'
        task_lister(project)
      elsif task_input == 'create'
        create_task_tasks_prompt
        create_tasks(project)
      elsif task_input == 'edit'
        edit_task_tasks_prompt
        edit_task(project)
      elsif task_input == 'complete'
        task_completed_tasks_prompt(project)
        task_completed(project)
      elsif task_input == 'back'
        task_menu = false
      elsif task_input == 'quit'
        welcome_menu = false
        task_menu = false
      end
    end
  end

  def print_project_menu
    puts "Welcome"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'edit' to edit a project"
    puts "'rename' to rename a project"
    puts "'delete' to rename a project"
  end

  def print_task_menu
    puts "Editing Project: #{print_projects} "
    puts "'list' to list tasks"
    puts "'create' to create a new task"
    puts "'edit' to edit a task"
    puts "'complete' to complete a task and remove it from the list"
  end

  def edit_projects_tasks_prompt
    puts "Which project would you like to edit?\n"
    puts "Projects:\n  *#{print_projects} "
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

  def add_project(create_project)
    @projects_with_tasks[create_project] = []
  end

  def remove_project(desired_project_to_delete)
    if @projects_with_tasks.has_key?(desired_project_to_delete)
      @projects_with_tasks.delete(desired_project_to_delete)
    end
  end

  def project_rename(project_to_rename)
    if @projects_with_tasks.has_key?(project_to_rename)
      new_name_projects_prompt
      new_project_name = gets.chomp
      @projects_with_tasks.delete(project_to_rename)
      @projects_with_tasks[new_project_name] = []
    end
  end

  def create_tasks(project)
    new_task = gets.chomp
    @projects_with_tasks[project] << new_task
  end

  def edit_task(project)
    edit_task = gets.chomp
    if @projects_with_tasks[project].include?(edit_task)
      new_task_name_tasks_prompt
      new_task_name = gets.chomp
      @projects_with_tasks[project].delete(edit_task)
      @projects_with_tasks[project] << new_task_name
    else
      task_not_found_tasks_prompt
    end
  end

  def task_completed(project)
    complete_task = gets.chomp
    if @projects_with_tasks[project].include?(complete_task)
      @projects_with_tasks[project].delete(complete_task)
      complete_task = "#{complete_task}: completed"
      @projects_with_tasks[project] << complete_task
    else
      task_not_found_tasks_prompt
    end
  end

  def task_lister(project)
    if @projects_with_tasks[project] == []
      puts '  none'
    else
      task_list = @projects_with_tasks[project].join(", ")
      puts task_list
    end
  end

  def print_projects
    list_names = ''
    if @projects_with_tasks == {}
      "none"
    else
      @projects_with_tasks.keys.join(", ")
    end
  end

  def real_puts message = ""
    $stdout.puts message
  end
end
