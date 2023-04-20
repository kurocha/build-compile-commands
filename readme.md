# Build Compile Commands

This package provides a target for generating `compile_commands.json`.

## Usage

```ruby
define_target "my-project" do |target|
	target.depends "Language/C++17"
	target.depends "Build/Compile/Commands"
	
	target.provides "Library/MyProject" do
		source_root = target.package.path + 'source'
		
		library_path = build dynamic_library: "MyProject", source_files: source_root.glob('**/*.{c,cpp}')
		
		# Generate compile_commands.json:
		compile_commands destination_path: (source_root + "compile_commands.json")
	end
end
```
