#DF-00 Drum Machine
#Coded by Davids Fiddle

#globals:
#volume
amp_kik = 1
amp_hihat = 1
amp_snare = 1
amp_tom = 1
amp_misc = 1
#patterns
#0=silence, 1=normal, 2...=special
pat_kik = [0]
pat_hihat = [0]
pat_snare = [0]
pat_tom = [0]
pat_misc = [0]
#FX
speed = 60
verb_mix = 0
verb_room = 0.6
#samples
sample_kik = :drum_bass_hard
sample_hihat1 = :drum_cymbal_pedal
sample_hihat2 = :drum_cymbal_closed
sample_snare = :drum_snare_hard
sample_tom1 = :drum_tom_lo_hard
sample_tom2 = :drum_tom_mid_hard
sample_tom3 = :drum_tom_hi_hard
sample_misc1 = :drum_cowbell
sample_misc2 = :drum_splash_hard
sample_misc3 = :vinyl_scratch
sample_misc4 = :perc_swash

#get OSC messages
#volume
live_loop :get_amp_kik do
  val = sync "/00_amp_kik"
  amp_kik = val[0]
end
live_loop :get_amp_hihat do
  val = sync "/00_amp_hihat"
  amp_hihat = val[0]
end
live_loop :get_amp_snare do
  val = sync "/00_amp_snare"
  amp_snare = val[0]
end
live_loop :get_amp_tom do
  val = sync "/00_amp_tom"
  amp_tom = val[0]
end
live_loop :get_amp_misc do
  val = sync "/00_amp_misc"
  amp_misc = val[0]
end
#patterns
live_loop :get_pat_kik do
  val = sync "/00_pat_kik"
  pat_kik = [0,0,0,0,0,0,0,0] if val[0] == 0
  pat_kik = [1,0,0,0,1,0,0,0] if val[0] == 1
  pat_kik = [1,0,0,1,1,0,0,0] if val[0] == 2
  pat_kik = [1,0,0,0,1,1,0,0] if val[0] == 3
  pat_kik = [1,0,1,0,1,0,1,0] if val[0] == 4
  pat_kik = [1,0,1,0,0,0,1,0] if val[0] == 5
  pat_kik = [1,1,1,1,1,1,1,1] if val[0] == 6
end
live_loop :get_pat_hihat do
  val = sync "/00_pat_hihat"
  pat_hihat = [0,0,0,0,0,0,0,0] if val[0] == 0
  pat_hihat = [1,1,1,1,1,1,1,1] if val[0] == 1
  pat_hihat = [1,1,2,1,1,1,0,1] if val[0] == 2
  pat_hihat = [1,2,1,1,1,2,1,1] if val[0] == 3
  pat_hihat = [1,2,1,2,1,2,1,2] if val[0] == 4
  pat_hihat = [1,1,2,1,1,1,2,1] if val[0] == 5
  pat_hihat = [1,2,1,0,1,2,1,0] if val[0] == 6
end
live_loop :get_pat_snare do
  val = sync "/00_pat_snare"
  pat_snare = [0,0,0,0,0,0,0,0] if val[0] == 0
  pat_snare = [0,0,1,0,0,0,1,0] if val[0] == 1
  pat_snare = [0,0,1,0,0,1,1,0] if val[0] == 2
  pat_snare = [0,0,1,0,0,1,0,1] if val[0] == 3
  pat_snare = [0,1,0,1,0,1,0,1] if val[0] == 4
  pat_snare = [0,0,1,0,1,0,0,0] if val[0] == 5
  pat_snare = [1,1,1,1,1,1,1,1] if val[0] == 6
end
live_loop :get_pat_tom do
  val = sync "/00_pat_tom"
  pat_tom = [0,0,0,0,0,0,0,0] if val[0] == 0
  pat_tom = [0,0,1,2,0,0,0,0] if val[0] == 1
  pat_tom = [0,0,0,0,3,1,0,0] if val[0] == 2
  pat_tom = [0,0,1,0,0,2,3,0] if val[0] == 3
  pat_tom = [0,0,0,0,0,0,0,0] if val[0] == 4
  pat_tom = [0,0,0,0,0,0,0,0] if val[0] == 5
  pat_tom = [0,0,0,0,0,0,0,0] if val[0] == 6
  pat_tom = [0,0,0,0,0,0,0,0] if val[0] == 7
end
live_loop :get_pat_misc do
  val = sync "/00_pat_misc"
  pat_misc = [0,0,0,0,0,0,0,0] if val[0] == 0
  pat_misc = [0,0,0,0,0,0,0,0] if val[0] == 1
  pat_misc = [0,0,0,0,0,0,0,0] if val[0] == 2
  pat_misc = [0,0,0,0,0,0,0,0] if val[0] == 3
  pat_misc = [0,0,0,0,0,0,0,0] if val[0] == 4
  pat_misc = [0,0,0,0,0,0,0,0] if val[0] == 5
  pat_misc = [0,0,0,0,0,0,0,0] if val[0] == 6
  pat_misc = [0,0,0,0,0,0,0,0] if val[0] == 7
end
#FX
live_loop :get_speed do
  val = sync "/00_speed"
  speed = val[0]
end
#samples
live_loop :get_sam_kik do
  val = sync "/00_sam_kik"
  sample_kik = :drum_bass_hard if val[0] == 0
  sample_kik = :bd_ada if val[0] == 1
  sample_kik = :bd_haus if val[0] == 2
  sample_kik = :bd_sone if val[0] == 3
end
live_loop :get_sam_hihat1 do
  val = sync "/00_sam_hihat1"
  sample_hihat1 = :drum_cymbal_pedal if val[0] == 0
  sample_hihat1 = :drum_cymbal_closed if val[0] == 1
end
live_loop :get_sam_hihat2 do
  val = sync "/00_sam_hihat2"
  sample_hihat2 = :drum_cymbal_closed if val[0] == 0
  sample_hihat2 = :drum_cymbal_open if val[0] == 1
end
live_loop :get_sam_snare do
  val = sync "/00_sam_snare"
  sample_snare = :drum_snare_hard if val[0] == 0
  sample_snare = :sn_dub if val[0] == 1
  sample_snare = :sn_dolf if val[0] == 2
  sample_snare = :sn_zome  if val[0] == 3
end



#Heartbeat
live_loop :beat do
  with_bpm speed do
    cue :heartbeat
    sleep 0.5
  end
end

#play
with_fx :reverb, mix: 0, mix_slide: 1, room: 0.6, room_slide: 1 do |effect|
  
  #kik
  live_loop :do_kik do
    #sync stuff
    sync_bpm :heartbeat
    tick
    #samples
    sample sample_kik, amp: amp_kik if pat_kik.ring.look == 1
  end
  
  #hihat
  live_loop :do_hihat do
    #sync stuff
    sync_bpm :heartbeat
    tick
    #samples
    sample sample_hihat1, amp: amp_hihat if pat_hihat.ring.look == 1
    sample sample_hihat2, amp: amp_hihat if pat_hihat.ring.look == 2
  end
  
  #snare
  live_loop :do_snare do
    #sync stuff
    sync_bpm :heartbeat
    tick
    #samples
    sample sample_snare, amp: amp_snare if pat_snare.ring.look == 1
  end
  
  #tom
  live_loop :do_tom do
    #sync stuff
    sync_bpm :heartbeat
    tick
    #samples
    sample sample_tom1, amp: amp_tom if pat_tom.ring.look == 1
    sample sample_tom2, amp: amp_tom if pat_tom.ring.look == 2
    sample sample_tom3, amp: amp_tom if pat_tom.ring.look == 3
  end
  
  #misc
  live_loop :do_misc do
    #sync stuff
    sync_bpm :heartbeat
    tick
    #samples
    sample sample_misc1, amp: amp_misc if pat_misc.ring.look == 1
    sample sample_misc2, amp: amp_misc if pat_misc.ring.look == 2
    sample sample_misc3, amp: amp_misc if pat_misc.ring.look == 3
    sample sample_misc4, amp: amp_misc if pat_misc.ring.look == 4
  end
  
  #get for fx-control has to be inside the fx
  live_loop :get_verb_mix do
    val = sync "/00_verb_mix"
    verb_mix = val[0]
    control effect, mix: verb_mix
  end
  live_loop :get_verb_room do
    val = sync "/00_verb_room"
    verb_room = val[0]
    control effect, room: verb_room
  end
end
