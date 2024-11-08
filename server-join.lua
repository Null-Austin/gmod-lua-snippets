require("gameevent") -- using a Binary Module because the Menu State doesn't has gameevent.Listen
gameevent.Listen( "client_beginconnect" )
hook.Add( "client_beginconnect", "client_beginconnect_example", function( data )
	local address = data.address		-- The Server address.
	local ip = data.ip					-- The Server IP. Use the address instead!
	local port = data.port				-- The Server Port.
	local source = data.source			-- The Source, why the client is connecting to the Server.

	local message = ('Player joining: ' .. address .. ':' .. port .. ' cause of ' .. source .. '.')
    
    print(message) -- control message
end )
