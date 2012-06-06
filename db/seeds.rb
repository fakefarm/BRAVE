if Rails.env.development?
  User.destroy_all
  Project.destroy_all
  Agreement.destroy_all
  
  
  names = { "The Boss" => "boss@boss.com", "regina" => "regina@regina.com", "peter" => "peter@peter.com", "homer" => "homer@homer.com",
            "elmer" => "elmer@elmer.com", "stewey"=> "stewey@stewey.com", "betty" => "betty@betty.com", 
            "bob" => "bob@bob.com", "lisa" => "lisa@lisa.com" }
  names.each { |name, email|  User.create name: name, email: email, role: "magician", password: "tree", password_confirmation: "tree" }
  client = Client.create name: "Client", email: "Client@client.com"
  
  rand(1000..5000)
  
  Project.create title: "Rails Project", client_email: client.email, client_id: client.id, is_active: true, project_amount: rand(1000..5000)
  Project.create title: "WordPress Project", client_email: client.email, client_id: client.id, is_active: true, project_amount: rand(1000..5000)
  Project.create title: "Design Project", client_email: client.email, client_id: client.id, is_active: true, project_amount: rand(1000..5000)
  Project.create title: "Beer and Donuts Project", client_email: client.email, client_id: client.id, is_active: true, project_amount: rand(1000..5000)
  
  projects = Project.all
  project_manager = User.find_by_name("The Boss")
  
  projects.each do |project|
    Agreement.create title: "Project Manager", description: "I'm in charge of everything", 
                     content: "I'll do such and such, make sure such and such is great, and I'll also provide the beer and donuts",
                     user_id: project_manager.id, project_id: project.id, is_admin: true, user_amount: 1000
    end
puts "BE BRAVE GENTLEMEN. THIS GUILD ISN'T GOING TO BUILD ITSELF...oh, and also, data has been added"
end