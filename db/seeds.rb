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
  s7 = Skill.create! skill_type: "Smart"
  s8 = Skill.create! skill_type: "Picnic Thieving"
  s9 = Skill.create! skill_type: "Fighting Baddies"
  s10 = Skill.create! skill_type: "Acting"
  s11 = Skill.create! skill_type: "Driving"
  s12 = Skill.create! skill_type: "Waste Management"
  s13 = Skill.create! skill_type: "Eating Cookies"
  s14 = Skill.create! skill_type: "Collecting"
  s15 = Skill.create! skill_type: "Practical Jokes"
  s16 = Skill.create! skill_type: "Flying"
  s17 = Skill.create! skill_type: "All Rounder"
  

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
    profile_pic: "gnuvzxtdywhzhoe6kqg4"
  )
  u2 = User.create!(
    first_name: "Luke",
    last_name: "Hammer",
    username: "textchimp",
    email: "luke@ga.co",
    password: "chicken",
    profile_pic: "yzqwkaf7fkk51a5zearv"
  )
  u3 = User.create!(
    first_name: "Rowena",
    last_name: "Leung",
    username: "ro_boat",
    email: "ro@ga.co",
    password: "chicken",
    profile_pic: "vu1dhd708rqjgm1v1zbt"
  )
  u4 = User.create!(
    first_name: "Bill",
    last_name: "Murray",
    username: "billy",
    email: "bill@murray.com",
    password: "chicken",
    profile_pic: "https://www.fillmurray.com/200/200"
  )

  u5 = User.create!(
    first_name: "Yogi",
    last_name: "Bear",
    username: "yogiB",
    email: "yogi@yellowstone.com",
    password: "chicken",
    profile_pic: "tvunpabbsy0zienhvqdo"
  )
  u6 = User.create!(
    first_name: "Boo",
    last_name: "Boo",
    username: "heyBooBoo",
    email: "booboo@yellowstone.com",
    password: "chicken",
    profile_pic: "ne2jf8lvwlhatamafrnn"
  )
  u7 = User.create!(
    first_name: "John",
    last_name: "McClane",
    username: "diehard",
    email: "bruce@willis.com",
    password: "chicken",
    profile_pic: "w3dhfhcrdvjr5oxzrz6h"
  )
  u8 = User.create!(
    first_name: "Brum",
    last_name: "Brumington",
    username: "BRUM88",
    email: "brum@email.com",
    password: "chicken",
    profile_pic: "mdua8esegrpycmvwibrt"
  )
  u9 = User.create!(
    first_name: "Oscar the",
    last_name: "Grouch",
    username: "iliveinabin",
    email: "oscar@suez.com",
    password: "chicken",
    profile_pic: "nk9kn2hxib4rlba4b152"
  )
  u10 = User.create!(
    first_name: "Cookie",
    last_name: "Monster",
    username: "COOKIES",
    email: "cmonster@ss.com",
    password: "chicken",
    profile_pic: "qufhnbcvhn5rqqozvkcy"
  )
  u11 = User.create!(
    first_name: "Ernie",
    last_name: "Muppet",
    username: "earnie",
    email: "emuppet@ss.com",
    password: "chicken",
    profile_pic: "ukhdt738iuw1arufq5lb"
  )
  u12 = User.create!(
    first_name: "Bert",
    last_name: "Muppet",
    username: "bert",
    email: "bmuppet@ss.com",
    password: "chicken",
    profile_pic: "x7gr37bfolgbuay3xljk"
  )
  u13 = User.create!(
    first_name: "Big",
    last_name: "Bird",
    username: "flappy",
    email: "bbird@ss.com",
    password: "chicken",
    profile_pic: "bd7rxndwcsbrklkweim0"
  )
  u14 = User.create!(
    first_name: "A",
    last_name: "Potato",
    username: "potato",
    email: "potato@vege.com",
    password: "chicken",
    profile_pic: "acy5d6yzabuncxuvouwg"
  )
  
  u1.skills << s1 << s2 << s3 << s4 << s5 << s6
  u2.skills << s2 << s3 << s4 << s5 << s6
  u3.skills << s3 << s4 << s5 << s6
  u4.skills << s4 << s5 << s6
  u5.skills << s7 << s5
  u6.skills << s8 << s5 << s6
  u7.skills << s9 << s10
  u8.skills << s11 << s5
  u9.skills << s12 << s1 << s2
  u10.skills << s13 << s4 << s5
  u11.skills << s14 << s5 << s6
  u12.skills << s15 << s2
  u13.skills << s16 << s4 << s5
  u14.skills << s17 << s4 << s5 << s6
 

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
    due_date: '2022/02/04 09:00',
    priority: 1,
    user_id: u1.id
  )
  p2 = Project.create!(
    title: 'Tic-Tac-Toe',
    description: 'Make a tic tac toe game',
    due_date: '2022/01/14',
    priority: 1,
    user_id: u1.id
  )
  p3 = Project.create!(
    title: 'Hardcore MTA',
    description: 'Do an MTA in ruby with more then one interchange. Find the shortest route from station to station.',
    due_date: '2025/12/25',
    priority: 2,
    user_id: u1.id
  )
  p4 = Project.create!(
    title: 'TV unit',
    description: 'Build a TV unit for the new house',
    due_date: '2021/09/10',
    priority: 3,
    user_id: u1.id
  )
  p5 = Project.create!(
    title: 'Party Time',
    description: 'Prepare for a party',
    due_date: '2022/02/04',
    priority: 2,
    user_id: u1.id
  )


  p6 = Project.create!(
    title: 'Steal a picnic',
    description: 'A most delicious heist',
    due_date: '2022/02/06',
    priority: 0,
    user_id: u5.id
  )
  p7 = Project.create!(
    title: 'Save Christmas',
    description: 'Save the city from the bad guys',
    due_date: '2022/12/25',
    priority: 3,
    user_id: u7.id
  )
  p8 = Project.create!(
    title: 'Prep for the Grand Prix',
    description: 'Prep the car for the big race.',
    due_date: '2022/02/05',
    priority: 1,
    user_id: u8.id
  )
  p9 = Project.create!(
    title: 'Clean up the city',
    description: 'The place is a mess...',
    due_date: '2023/01/01',
    priority: 2,
    user_id: u9.id
  )
  p10 = Project.create!(
    title: 'Cookie Festival',
    description: 'Organise the cookie fesival',
    due_date: '2021/01/02',
    priority: 1,
    user_id: u10.id
  )
  p11 = Project.create!(
    title: 'Do muppet things',
    description: 'Some task that muppets do?',
    due_date: '2024/03/10',
    priority: 3,
    user_id: u11.id
  )

  puts "#{Project.count} projects created".blue
  puts "#{Project.pluck(:title).join ', '}".yellow
  puts 



  Task.destroy_all
# TASK SEEDS

  puts
  print "Creating tasks ...:".red

  t1 = Task.create!(
    title: 'Setup the project files',
    description: 'Create a git repo, make the Rails project, initialize the DB.',
    due_date: '2022/01/29  09:00',
    status: 0,
    priority: 1,
    user_id: u1.id,
    project_id: p1.id 
  )
  t2 = Task.create!(
    title: 'Help Dan fix everything',
    description: 'Provide all the help to Dan, for every bug and issue he creates',
    due_date: '2022/02/04',
    status: 1,
    priority: 1,
    user_id: u2.id,
    project_id: p1.id 
  )
  t3 = Task.create!(
    title: 'Provide Feedback',
    description: "Tell Dan all the mistake's hes making with his project. Ideally before he makes them.",
    due_date: '2022/02/04',
    status: 2,
    priority: 1,
    user_id: u3.id,
    project_id: p1.id 
  )
  t4 = Task.create!(
    title: 'Play the game',
    description: "Play tic-tac-toe until you beat the AI",
    status: 2,
    priority: 1,
    user_id: u4.id,
    project_id: p2.id 
  )
  t5 = Task.create!(
    title: 'Psudo Code',
    description: "Think through the solution and write some psudo code.",
    due_date: '2023/04/10',
    status: 1,
    priority: 1,
    user_id: u1.id,
    project_id: p3.id 
  )
  t6 = Task.create!(
    title: 'Write the program',
    description: "Bang out a solution to HARDCORE MTA",
    due_date: '2024/04/10',
    status: 2,
    priority: 2,
    user_id: u3.id,
    project_id: p3.id 
  )
  t7 = Task.create!(
    title: 'Refactor',
    description: "As the title suggests, refactor the solution for readability",
    due_date: '2025/04/10',
    status: 1,
    priority: 3,
    user_id: u4.id,
    project_id: p3.id 
  )
  t8 = Task.create!(
    title: 'Enjoy watching TV',
    description: "Binge some tv shows infront of the TV while admiring the furniture",
    due_date: '2022/02/05',
    status: 1,
    priority: 1,
    user_id: u1.id,
    project_id: p4.id 
  )
  t9 = Task.create!(
    title: 'Food',
    description: "Prep all the food for the party",
    due_date: '2022/02/04',
    status: 2,
    priority: 2,
    user_id: u2.id,
    project_id: p5.id 
  )
  t10 = Task.create!(
    title: 'Drinks',
    description: "Beers, beers, beers",
    due_date: '2022/02/04',
    status: 2,
    priority: 1,
    user_id: u2.id,
    project_id: p5.id 
  )
  t11 = Task.create!(
    title: 'Music',
    description: "Make a party playlist",
    due_date: '2022/02/04',
    status: 4,
    priority: 3,
    project_id: p5.id 
  )
  t12 = Task.create!(
    title: 'Pyro',
    description: "Organise a sweet private fireworks show",
    due_date: '2022/02/04',
    status: 4,
    priority: 2,
    project_id: p5.id 
  )
  t13 = Task.create!(
    title: 'Scare away the public',
    description: "Make bear sounds to scare the punters away from their picnics!",
    due_date: '2022/02/05',
    status: 1,
    priority: 1,
    user_id: u6.id,
    project_id: p6.id 
  )
  t14 = Task.create!(
    title: 'Fight the evil bad guys',
    description: "Stop Gruber from stealing the bearer bonds again!",
    due_date: '2022/12/25',
    status: 1,
    priority: 1,
    user_id: u7.id,
    project_id: p7.id 
  )
  t15 = Task.create!(
    title: 'Oil Change',
    description: "Just an oil change, then Brum will be able to win for sure!",
    due_date: '2099/3/25',
    status: 2,
    priority: 2,
    user_id: u8.id,
    project_id: p8.id 
  )
  t16 = Task.create!(
    title: 'Pickup the trash',
    description: "Collect all the rubbish and put it in the bin",
    due_date: '2022/3/25',
    status: 2,
    priority: 2,
    user_id: u9.id,
    project_id: p9.id 
  )
  t17 = Task.create!(
    title: 'Get funding',
    description: "Meet with potentail investers. REMEMBER *** DON'T EAT ALL THE COOKIES***",
    due_date: '2022/4/25',
    status: 2,
    priority: 2,
    user_id: u10.id,
    project_id: p10.id 
  )
  t18 = Task.create!(
    title: 'Film an ep of Sesame Street',
    description: "Educate the next generation",
    due_date: '2022/5/25',
    status: 1,
    priority: 1,
    user_id: u11.id,
    project_id: p11.id 
  )
  

  puts "#{Task.count} tasks created".blue
  puts "#{Task.pluck(:title).join ', '}".yellow
  puts 



