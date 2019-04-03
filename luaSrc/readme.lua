--[[
Game made by orangebaron
An experiment in using github in coordination with roblox
https://github.com/orangebaron/r-o-b-l-o-x
Game is licensed under the GNU General Public License, see game.ServerScriptService.LICENSE
Long story short, use whatever you want from this game, but if you use my code, include the GNU license with it and make it uncopylocked

OVERVIEW OF MY SETUP:
placegen.lua (included in the github, not here) generates a roblox place xml file from lua and xml sources
game.ServerScriptService.main calls the function returned by game.ServerScriptService.mainFunction, which in turn calls a bunch more module scripts for each individual function I want to do
This has a few benefits, mainly organization (if you know what function you want to look at, it's easy to find it)
]]
