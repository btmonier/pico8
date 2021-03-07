pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

-- Make Lua act OOP-ish...

function _init()
    bullet={}
    player={
    	px=64,
    	py=64,
    	pdx=1,
    	pdy=1,
    	color=7
    }
end

function _draw()
    cls()
    for b in all(bullet) do
        b:draw()
    end
    draw_player()
end

function _update60()
    dx=0
    dy=-4

    if btn(0) then
        dx=-4
        dy=0
        player["px"]-=player["pdx"]
    end
    if btn(1) then
        dx=4
        dy=0
        player["px"]+=player["pdx"]
    end
    if btn(2) then
        dx=0
        dy=-4
        player["py"]-=player["pdy"]
    end
    if btn(3) then
        dx=0
        dy=4
        player["py"]+=player["pdy"]
    end

    if btn(4) then
        add_new_bullet(dx,dy)
    end

    for b in all(bullet) do
       b:update() 
    end
end


function add_new_bullet(_dx,_dy)
    add(bullet, {
        x=player["px"],
        y=player["py"],
        dx=_dx,
        dy=_dy,
        life=60,
        draw=function(self)
            pset(self.x,self.y,10)
        end,
        update=function(self)
            self.x+=self.dx
            self.y+=self.dy
            self.life-=1
            if self.life < 0 then
                del(bullet, self)
            end
        end
    })
end

function draw_player()
	pset(player["px"], player["py"]-1, player["color"]) -- top
	pset(player["px"], player["py"]+1, player["color"]) -- bottom
	pset(player["px"]-1, player["py"], player["color"]) -- left
	pset(player["px"]+1, player["py"], player["color"]) -- right
	pset(player["px"], player["py"], player["color"])   -- center
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
