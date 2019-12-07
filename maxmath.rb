# Init vars and fixtures
num_of_task = 2
tasks = []
num_range = 0..5
good_mark = "\u{1f603}\u{1f44d}"
bad_mark = "\u{1f61f}\u{1f44e}"
clap_mark = "\u{1f44f}"

# Random & fill the array of tasks
while tasks.count < num_of_task
  n = "#{rand(num_range)} + #{rand(num_range)}"
  tasks << n unless tasks.include? n
end

# Main
system "clear"
tasks.each { |task|
  task_answer = (eval task).to_i
  loop do
    system "clear"
    print "#{task} = "
    answered = STDIN.gets.chomp.to_i
    break if answered == task_answer
    print "Wrong! #{bad_mark}\nTry again.."
    STDIN.getc.chomp
  end
  print "Good! #{good_mark}\nPress to continue!"
  STDIN.getc.chomp
}
system "clear"
puts "Finish! #{"\u{1f4af}"}#{clap_mark * 3}"
