
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "3.0"

define_target "build-compile-commands" do |target|
	target.provides "Build/Compile/Commands" do
		define Rule, "compile_commands.generate" do
			input :source_files, multiple: true, implicit: true do
				(environment[:build_prefix] + environment.checksum).glob('**/*.compile_command.json')
			end
			
			output :destination_path
			
			apply do |parameters|
				commands = []
				
				parameters[:source_files].each do |source_file|
					commands << JSON.load_file(source_file)
				end
				
				File.write(parameters[:destination_path], JSON.generate(commands))
			end
		end
	end
end
