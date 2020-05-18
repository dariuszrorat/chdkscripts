--[[
@title White balance bracketing
@chdk_version 1.3
@param d Daylight
    @default d 0
    @values d No Yes
@param c Cloudy
    @default c 0
    @values c No Yes
@param t Tungsten
    @default t 0
    @values t No Yes
@param f Fluorescent
    @default f 0
    @values f No Yes
@param h Fluorescent H
    @default h 0
    @values h No Yes
 --]]

--setup
 set_console_layout(1, 0, 45, 12)

 print("White balance bracketing started...")

-- switch to shooting mode
 if ( get_mode() == false ) then
    sleep(1000)
    set_record(1)
    while ( get_mode() == false) do
       sleep(100)
    end
 end
 sleep(100)

-- focus and take exposure
 press("shoot_half")
 repeat
    sleep(50)
 until get_shooting() == true
    release("shoot_half")
 repeat
    sleep(50)
 until get_shooting() == false
   set_aflock(1)

--shoot
   print("Auto")
   set_prop(268, 0)
   shoot()

   if (d == 1) then
       print("Daylight")
       set_prop(268, 1)
       shoot()
   end
   if (c == 1) then
       print("Cloudy")
       set_prop(268, 2)
       shoot()
   end
   if (t == 1) then
       print("Tungsten")
       set_prop(268, 3)
       shoot()
   end
   if (f == 1) then
       print("Fluorescent")
       set_prop(268, 4)
       shoot()
   end
   if (h == 1) then
       print("Fluorescent H")
       set_prop(268, 5)
       shoot()
   end

set_prop(268, 0)
set_aflock(0)
print("...done")
