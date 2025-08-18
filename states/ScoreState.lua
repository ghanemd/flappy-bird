--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local bronzeTrophy = love.graphics.newImage('assets/images/bronze.png')
local silverTrophy = love.graphics.newImage('assets/images/silver.png')
local goldenTrophy = love.graphics.newImage('assets/images/gold.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()

    if self.score <= 1 then
        love.graphics.draw(bronzeTrophy, VIRTUAL_WIDTH / 2 - bronzeTrophy:getWidth() / 2, 24)
    elseif self.score == 2 then 
        love.graphics.draw(silverTrophy, VIRTUAL_WIDTH / 2 - silverTrophy:getWidth() / 2, 24)
    else 
        love.graphics.draw(goldenTrophy, VIRTUAL_WIDTH / 2 - goldenTrophy:getWidth() / 2, 24)
    end

    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 114, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
end