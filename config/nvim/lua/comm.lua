 local M = {}
 -- Function to generate XML documentation
 function Commy()
   -- Get the current buffer
   local buffer = vim.api.nvim_get_current_buf()
   -- Get the current buffer's contents
   local contents = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
   -- Initialize the XML document
   local xml_doc = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<doc>\n"
   -- Iterate over the lines in the buffer
   for _, line in ipairs(contents) do
     -- Check if the line is a comment
     if string.match(line, "^//") then
       -- Extract the comment text
       local comment_text = string.match(line, "^//(.*)")
       -- Add the comment to the XML document
       xml_doc = xml_doc .. "<comment>" .. comment_text .. "</comment>\n"
     end
   end
   -- Close the XML document
   xml_doc = xml_doc .. "</doc>"
   end
return M
