local M = {}
function M.config()
require 'code_runner'.setup{
  -- put here the commands by filetype
  filetype = {
		--java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		--python = "python3 -u",
		--typescript = "deno run",
		cpp = "g++ $file -o ${fileNameWithoutExt}.out && ./$fileNameWithoutExt.out",
		--rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},
}

end
return M
