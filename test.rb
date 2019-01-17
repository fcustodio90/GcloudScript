require "google/cloud/translate"
require 'byebug'

# isto é para testar se a tradução está a funcionar

# this is to test if the translation is working

# this is to test if the translation is working

# this is to test if the translation is working

# acho que vai dar algum tipo de erro.

# I think it will give some kind of error.

# I think it will give some kind of error.

# I think it will give some kind of error.


project_id = "FILL_IN"
translate = Google::Cloud::Translate.new project: project_id

rb_files = Dir.glob(File.join("**", "*.rb"))

rb_files.each do |file_name|
  new_lines = ''
  File.readlines(file_name).each do |line|
    text = line
    target = 'en'
    translation = translate.translate text, to: target
    new_lines += line.gsub(/^\#\s(.*)$/, "#{line}\n#{translation}")
  end
  File.open(file_name, "w") { |file| file.puts new_lines }
end
