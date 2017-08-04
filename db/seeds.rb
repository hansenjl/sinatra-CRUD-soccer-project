form1 = Formation.create(:name => "4-4-2")
form2 = Formation.create(:name => "4-3-3")

Position.create(:name => "sweeper",:formation_id => form1)
Position.create(:name => "sweeper",:formation_id => form2)

Position.create(:name => "stopper",:formation_id => form1)
Position.create(:name => "stopper",:formation_id => form2)

Position.create(:name => "right defender",:formation_id => form1)
Position.create(:name => "right defender",:formation_id => form2)

Position.create(:name => "left defender",:formation_id => form1)
Position.create(:name => "left defender",:formation_id => form2)

Position.create(:name => "left mid",:formation_id => form1)
Position.create(:name => "left mid",:formation_id => form2)

Position.create(:name => "right mid",:formation_id => form1)
Position.create(:name => "right mid",:formation_id => form2)

Position.create(:name => "center mid 1",:formation_id => form1)
Position.create(:name => "center mid",:formation_id => form2)

Position.create(:name => "center mid 2",:formation_id => form1)
Position.create(:name => "center forward",:formation_id => form2)

Position.create(:name => "left forward",:formation_id => form1)
Position.create(:name => "left forward",:formation_id => form2)

Position.create(:name => "right forward",:formation_id => form1)
Position.create(:name => "right forward",:formation_id => form2)