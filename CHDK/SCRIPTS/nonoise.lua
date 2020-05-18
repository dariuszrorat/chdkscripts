--[[
@title Zero Noise
@chdk_version 1.3
@param d Delay before first shoot
@default d 2
@param f Overexposure EV
@default f 4
--]]

sleep(d*1000)

print("1) normal")
  shoot()

  set_aflock(1)
  p=get_av96()
  s=get_sv96()
  t=get_tv96()

print("2) bright")
  set_tv96_direct(t-(f*96))
  set_sv96(s)
  set_av96(p)
  shoot()

set_aflock(0)
print("...done")
