-- AeroGenesis A330-300
-- PFDcapt_driver.lua
-- by @quackderbruchpilot_ (Discord)

-----------------------------------------------------------------------------------------------------
-- SELF TEST logic 40secs after turning on GPU/APU PWR
--

-- declaring variables
size = {PFDcapt_width, PFDcapt_height}                          -- define component size

ADIRS1_knob_position = globalProperty("laminar/A333/buttons/adirs/ir1_knob_pos")
ADIRS_status = globalProperty("AG330/ADIRS/setToNAV")

function update ()
    if get(ADIRS1_knob_position) == 1 then
        set(ADIRS_status, 1)
    elseif get(ADIRS1_knob_position) == 0 then
        set(ADIRS_status, 0)
    end
    --sasl.logDebug(ADIRS_status)
end

-----------------------------------------------------------------------------------------------------------------
-- draw
--

function draw()
    sasl.gl.drawRectangle(0, 0, PFDcapt_width, PFDcapt_height, {0, 0, 0, 0})
    getTargetTextureData(texture_PFDcapt, PFDcapt_x, PFDcapt_y, PFDcapt_width, PFDcapt_height)
end
-----------------------------------------------------------------------------------------------------
