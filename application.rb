class Application


  def run
    @running = true
    puts "Welcome to your contact list amigo"
    while @running == true
      show_main_menu
    end
  end

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?".green
    puts " new      - Create a new contact"
    puts " update   - Update a contact"
    puts " list     - List all contacts"
    puts " delete   - Delete a contact"
    puts " quit     - Exit Application"
    puts " find     - Find a contact"
    print "> "
    evaluate_input
  end

def evaluate_input

    @input = gets.chomp.downcase
    if @input == "new"
      new_contact
    elsif @input == "list"
      list_all_contact
    elsif @input == "find"
      find_by_id
    elsif @input == "update"
      contact_update
    elsif @input == "delete"
      Contact.all.each { |contact| puts "Name: #{contact.first_name} #{contact.last_name}, Email:#{contact.email}, Phone:#{contact.phone}"}
      puts "What is the id of the contact you wish to delete?".red
      id = gets.chomp
      Contact.find(id).destroy
    elsif @input == "quit"
      @running = false
    else
      puts "Da fuck you thinking son? Does Marcelus Wallus look like a bitch? Try again."
      show_main_menu
    end
  end

  def list_all_contact
    Contact.all.each { |contact| puts "Name: #{contact.first_name} #{contact.last_name}, Email:#{contact.email}, Phone:#{contact.phone}"}
  end

  def get_info
    puts "Enter contacts first name:"
    @first_name = gets.chomp
    puts "Enter contacts last name:"
    @last_name = gets.chomp
    puts "Enter your contacts email:"
    @email = gets.chomp
    puts "Enter your contacts phone number:"
    @phone = gets.chomp
  end

  def new_contact
    get_info
    Contact.create(first_name:@first_name, last_name: @last_name, email: @email, phone: @phone )
  end

  def contact_update
    puts "What is the ID of the contact you wish to update?"
    id = gets.chomp
    get_info
    Contact.update(id,first_name:@first_name, last_name: @last_name, email: @email, phone: @phone )
  end

  def find_by_id
    puts "What is the ID of the contact you wish to find?"
    id = gets.chomp
    found = Contact.find(id)
    puts "#{found.first_name} #{found.last_name}, Email:#{found.email}, Phone:#{found.phone}"
  end

end
