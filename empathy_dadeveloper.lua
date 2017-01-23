local frame = CreateFrame("frame");

frame:RegisterEvent('PLAYER_LOGIN');
frame:RegisterEvent('GUILD_ROSTER_UPDATE');

local function event_dispatch(self, event, arg1, arg2, arg3, ...)
	if event == "PLAYER_LOGIN" then
		print("Hallo");
		GuildRoster();
	else
		numTotalMembers, numOnlineMaxLevel, numOnline = GetNumGuildMembers();
		print("Es sind " .. numOnline .. " von " .. numTotalMembers .. "Guildies online");
		for i=1, numTotalMembers do
			local name, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName, achievementPoints, achievementRank, isMobile, isSoREligible, standingID = GetGuildRosterInfo(i)
			print(name);
			if online then
				SendChatMessage("Hallo, " .. name, "GUILD");
			end
		end
	end
end

frame:SetScript("OnEvent", event_dispatch);
