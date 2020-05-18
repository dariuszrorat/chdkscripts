--[[
@title Effect bracketing
@chdk_version 1.3
@param v Vivid Colors
    @default v 0
    @values v No Yes
@param n Natural Colors
    @default n 0
    @values n No Yes
@param b Black and White
    @default b 0
    @values b No Yes
@param s Sepia
    @default s 0
    @values s No Yes
 --]]

--setup
 set_console_layout(1, 0, 45, 12)

 print("Effect bracketing started...")

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
   print("No effects")
   set_prop(184, 0)
   shoot()

   if (v == 1) then
       print("Vivid Colors")
       set_prop(184, 1)
       shoot()
   end
   if (n == 1) then
       print("Natural Colors")
       set_prop(184, 2)
       shoot()
   end
   if (b == 1) then
       print("Black and White")
       set_prop(184, 3)
       shoot()
   end
   if (s == 1) then
       print("Sepia")
       set_prop(184, 4)
       shoot()
   end

set_prop(184, 0)
set_aflock(0)
print("...done")
