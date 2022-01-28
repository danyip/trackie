# SKILL SEEDS
Skill.destroy_all

  puts
  print "Creating skills ...:".red

  s1 = Skill.create! skill_type: "JavaScript"
  s2 = Skill.create! skill_type: "HTML"
  s3 = Skill.create! skill_type: "CSS"
  s4 = Skill.create! skill_type: "Ruby"
  s5 = Skill.create! skill_type: "Rails"
  s6 = Skill.create! skill_type: "React"

  puts "#{Skill.count} skills created".blue
  puts "#{Skill.pluck(:skill_type).join ', '}".yellow
  puts 


# USER SEEDS
User.destroy_all
  puts
  print "Creating users ...".red

  u1 = User.create!(
    first_name: "Daniel",
    last_name: "Yip",
    username: "yipples",
    email: "danielyip90@gmail.com",
    password: "chicken",
    profile_pic: "http://www.placekitten.com/200/200"
  )
  u2 = User.create!(
    first_name: "Luke",
    last_name: "Hammer",
    username: "textchimp",
    email: "luke@ga.co",
    password: "chicken",
    profile_pic: "http://www.placekitten.com/300/300"
  )
  u3 = User.create!(
    first_name: "Rowena",
    last_name: "Leung",
    username: "ro_boat",
    email: "ro@ga.co",
    password: "chicken",
    profile_pic: "http://www.placekitten.com/250/250"
  )
  u4 = User.create!(
    first_name: "Bill",
    last_name: "Murray",
    username: "billy",
    email: "bill@murray.com",
    password: "chicken",
    profile_pic: "http://www.fillmurray.com/200/200"
  )

  u1.skills << s1 << s2 << s3 << s4 << s5 << s6
  u2.skills << s2 << s3 << s4 << s5 << s6
  u3.skills << s3 << s4 << s5 << s6
  u4.skills << s4 << s5 << s6

  puts "#{User.count} users created".blue
  puts "#{User.pluck(:first_name).join ', '}".yellow
  puts


# PROJECT SEEDS
Project.destroy_all 

  puts
  print "Creating projects ...:".red

  p1 = Project.create!(
    title: 'Project_1',
    description: 'Build a full-stack application using Rails.',
    due_date: '2022/02/04',
    priority: 1,
    progress: 20
  )

  p2 = Project.create!(
    title: 'Tic-Tac-Toe',
    description: 'Make a tic tac toe game',
    due_date: '2022/01/14',
    priority: 1,
    progress: 100
  )

  p3 = Project.create!(
    title: 'Hardcore MTA',
    description: 'Do an MTA in ruby with more then one interchange. Find the shortest route from station to station.',
    due_date: '2025/12/25',
    priority: 8,
    progress: 0
  )

  p4 = Project.create!(
    title: 'TV unit',
    description: 'Build a TV unit for the new house',
    due_date: '2021/09/10',
    priority: 5,
    progress: 100
  )

  p5 = Project.create!(
    title: 'Party Time',
    description: 'Prepare for a party',
    due_date: '2022/02/04',
    priority: 2,
    progress: 0
  )

  puts "#{Project.count} projects created".blue
  puts "#{Project.pluck(:title).join ', '}".yellow
  puts 

  p1.users << u1 << u2 << u3 << u4
  p2.users << u1
  p3.users << u3 << u4 << u1
  p4.users << u1
  p5.users << u2 << u3 << u4


# TASK SEEDS
Task.destroy_all

  puts
  print "Creating tasks ...:".red

  t1 = Task.create!(
    title: 'Setup the project files',
    description: 'Create a git repo, make the Rails project, initialize the DB.',
    duration: '60',
    due_date: '2022/01/29',
    status: 1,
    priority: 1,
    project_id: p1.id 
  )

  

  t2 = Task.create!(
    title: 'Help Dan fix everything',
    description: 'Provide all the help to Dan, for every bug and issue he creates',
    duration: '600',
    due_date: '2022/02/04',
    status: 1,
    priority: 1,
    project_id: p1.id 
  )
  

  t3 = Task.create!(
    title: 'Provide Feedback',
    description: "Tell Dan all the mistake's hes making with his project. Ideally before he makes them.",
    duration: '5',
    due_date: '2022/02/04',
    status: 1,
    priority: 1,
    project_id: p1.id 
  )
  
  
  t4 = Task.create!(
    title: 'Play the game',
    description: "Play tic-tac-toe until you beat the AI",
    duration: '10000',
    status: 5,
    priority: 1,
    project_id: p2.id 
  )
  

  t5 = Task.create!(
    title: 'Psudo Code',
    description: "Think through the solution and write some psudo code.",
    duration: '240',
    due_date: '2023/04/10',
    status: 5,
    priority: 1,
    project_id: p3.id 
  )
  

  t6 = Task.create!(
    title: 'Write the program',
    description: "Bang out a solution to HARDCORE MTA",
    duration: '580',
    due_date: '2024/04/10',
    status: 5,
    priority: 2,
    project_id: p3.id 
  )
  

  t7 = Task.create!(
    title: 'Refactor',
    description: "As the title suggests, refactor the solution for readability",
    duration: '60',
    due_date: '2025/04/10',
    status: 5,
    priority: 3,
    project_id: p3.id 
  )
  

  t8 = Task.create!(
    title: 'Enjoy watching TV',
    description: "Binge some tv shows infront of the TV while admiring the furniture",
    duration: '1440',
    due_date: '2022/02/05',
    status: 5,
    priority: 1,
    project_id: p4.id 
  )
  

  t9 = Task.create!(
    title: 'Food',
    description: "Prep all the food for the party",
    duration: '60',
    due_date: '2022/02/04',
    status: 5,
    priority: 2,
    project_id: p5.id 
  )
  

  t10 = Task.create!(
    title: 'Drinks',
    description: "Beers, beers, beers",
    duration: '60',
    due_date: '2022/02/04',
    status: 5,
    priority: 1,
    project_id: p5.id 
  )
  

  t11 = Task.create!(
    title: 'Music',
    description: "Make a party playlist",
    duration: '60',
    due_date: '2022/02/04',
    status: 5,
    priority: 3,
    project_id: p5.id 
  )
  

  t12 = Task.create!(
    title: 'Pyro',
    description: "Organise a sweet private fireworks show",
    duration: '60',
    due_date: '2022/02/04',
    status: 5,
    priority: 4,
    project_id: p5.id 
  )
  

  puts "#{Task.count} tasks created".blue
  puts "#{Task.pluck(:title).join ', '}".yellow
  puts 

  t1.users << u1
  t2.users << u2
  t3.users << u3
  t4.users << u4
  t5.users << u1
  t6.users << u3
  t7.users << u4
  t8.users << u1
  t9.users << u2
  t10.users << u2
  t11.users << u3
  t12.users << u4

