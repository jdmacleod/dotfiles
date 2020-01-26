class Array
  def not_contain(other_arr)
    unless other_arr.is_a? Array
      raise ArgumentError, "The argument must be an array"
    end

    select { |s| !other_arr.any? { |o| s[o] } }
  end
  def contain(other_arr)
    unless other_arr.is_a? Array
      raise ArgumentError, "The argument must be an array"
    end

    select { |s| other_arr.any? { |o| s[o] } }
  end
end

desc "Install OS-specific config files"
task :installforos do
  linkables = Dir.glob('*/**{.symlink}')
  operating_systems = ['osx', 'redhat', 'ubuntu']
  skip_all = false
  overwrite_all = false
  backup_all = false

  print "Which OS config files do you want to link? (#{operating_systems.join("/")}) "
  myos = STDIN.gets.chomp

  myos = "osx" if myos.eql?("Darwin")

  if myos.eql?("Linux")
    lsb_release = `lsb_release -a`.strip
    if lsb_release =~ /Ubuntu/
      myos = "ubuntu"
    else
      myos = "redhat"
    end
  end

  unless operating_systems.include?(myos)
    abort "OS #{myos.inspect} is not supported."
  end

  linkables.contain([myos]).each do |linkable|
    overwrite = false
    backup = false

    file = File.basename(linkable, '.*')
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"` unless skip_all
  end
end

desc "Hook our dotfiles into system-standard positions."
task :install do

  install_oh_my_zsh
  switch_to_zsh
  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false
  operating_systems = ['centos', 'osx', 'ubuntu']

  linkables.not_contain(operating_systems).each do |linkable|
    overwrite = false
    backup = false

    file = File.basename(linkable, '.*')
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do

  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end

  end
end

task :default => 'install'

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "already using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end
