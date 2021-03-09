-- Make PICO-8 and Lua more "OOP-ish" (part 2)

-- variables
-- local player
local debug = true


-- game loop
function _init()
	player = {
		x = 64,
		y = 64,
		dx = 1,
		dy = 1,
		color = 10,
		update = function(self) 
			r = move(self.x, self.y, self.dx, self.dy)
			self.x = r[1]
			self.y = r[2]
		end,
		draw = function(self)
			cls()
			pset(self.x, self.y, self.color)
			if (debug) then
				rect(self.x - 2, self.y - 2, self.x + 2, self.y + 2, 8)
				print("-player -", self.x - 2, self.y - 20)
				print("pos x: "..self.x, self.x - 2, self.y - 14)
				print("pos y: "..self.y, self.x - 2, self.y - 8)
			end

		end
	}
end

function _update()
	player:update()
end

function _draw()
	player:draw()
end


function move(x, y, dx, dy)
    if btn(0) then
        x -=dx
    end
    if btn(1) then
        x +=dx
    end
    if btn(2) then
        y -=dy
    end
    if btn(3) then
        y +=dy
    end

    return {x, y}
end
