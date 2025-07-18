local mod_path = SMODS.current_mod.path

-- guess where i stole these from :3

local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("Nanumod Loading file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) --Steamodded actually does a really good job of displaying this info! So we don't need to do anything else.
	end
    f()
end

local files = NFS.getDirectoryItems(mod_path .. "lib")
for _, file in ipairs(files) do
	print("Nanumod Loading library file " .. file)
	local f, err = SMODS.load_file("lib/" .. file)
	if err then
		error(err) --Steamodded actually does a really good job of displaying this info! So we don't need to do anything else.
	end
	f()
end