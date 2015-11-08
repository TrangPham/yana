# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'net/http'
require 'uri'

def persist_to_es(story)
  url = URI.parse('http://localhost:54321/api/entry')
  request = Net::HTTP::Post.new(url.request_uri)
  http = Net::HTTP.new(url.host, url.port)
  request.set_form_data('payload' => story.to_json)

  response = http.request(request)
  if response.code != "200"
    puts 'Could not presist to Elastic Search DB.'
  end
end

#Delete all ES entries
`es_script/createIndex.sh`
`es_script/participantMapping.sh`
`es_script/entryMapping.sh`



tim = User.new(
  name: 'Timothy Cheung',
  email: 'timothycheung@gmail.com',
  password: 'timothycheung',
  category: 'patient',
  bio: "I enjoyed teaching as a professor in Gender's Studies and got diagnosed with microvascular dementia five years into my dream job. Being forgetful has put me into so many awkward situation that would never have imagined"
)
tim.save!

michael = User.new(
  name: 'Michael Xie',
  email: 'michaelxie@gmail.com',
  password: 'michaelxie',
  category: 'patient',
  bio: "I have three wonderful children and worked as a social worker. After being diagnosed with mid-stage dementia, I don't want my hopes and dreams be left unheard."
)
michael.save!

daniel = User.new(
  name: 'Daniel Chang',
  email: 'danielchang@gmail.com',
  password: 'danielchang',
  category: 'caregiver',
  bio: "My mom has been battling dementia for several years now. I have been her sole caregiver through this journey, and I hope I can help others navigate through this quagmire by sharing my stories."
)
daniel.save!

thu = User.new(
  name: 'Thu Trang Pham',
  email: 'thutrangpham@gmail.com',
  password: 'thutrangpham',
  category: 'patient',
  bio: "I was diagnosed with dementia in 2009. In the beginning, I was angry, but I've come to realize I can live a better life by embracing the diagnosis. In fact, thinking back, there have been some funny stories."
)
thu.save!

tom = User.new(
  name: 'Tom Bobby Choi',
  email: 'tombobbychoi@gmail.com',
  password: 'tombobbychoi',
  category: 'caregiver',
  bio: "I am taking care of my husband, who is diagnosed with Alzheimer's. I hope that my experiences would help others in some way."
)
tom.save!

story_list = []

# Stories
story_list << Story.create!(
  user_id: tim.id,
  created_at: 1296864000,
  private: true,
  content:
  "During my going-away meeting with Gender Studies, the faculty gave me this
  journal. In it I’ll report my descent into the post-cerebral realm for which I
  am headed. No whimpering, no whining, no despair. Just the facts."
)

story_list << Story.create!(
  user_id: tim.id,
  private: true,
  created_at: 1299110400,
  content:
  "Saturday at the mall I performed the physical motions of shoplifting—walked
  out of Macy’s with a pair of pants over my arm. I only noticed when I was
  inside Dillard’s on the opposite side of the mall. I hurried back, ready to
  explain. There were no salespeople around, and no one noticed when I put them
  back."
)

story_list << Story.create!(
  user_id: michael.id,
  created_at: 857779200,
  content: "My heart does not come to rest."
)

story_list << Story.create!(user_id: michael.id,
  created_at: 858038400,
  content: "I have started thinking seriously again that I have for years wanted to
  write an uncomplicated book without big words or much learning. Would I be
  able to do that? I will try. The least is that I will have a book to my name.
  Most importantly, it will create! an activity here in my retirement center
  where I spend most of my time alone. In any other private house I would have
  been alone too."
)

story_list << Story.create!(
  user_id: michael.id,
  created_at: 858556800,
  content: "In all my hobbies [painting, sketching, reading] I was well away when I
  became ill last year in early February; after my illness, however, I could not
  even write my name or write as I’m doing here now. What used to be everyday
  things had to come back gradually."
)

story_list << Story.create!(
  user_id: michael.id,
  created_at: 858816000,
  content: "The society in which we and our children find ourselves provides for the
  care of children from when they’re small, adults work the whole day, old people are 
  rightfully taken care of in retirement and old-age homes. However, what about the 
  wherewithal of which loneliness snips the wings? Or those like me, who “struggle to 
  keep busy,” if one can even call that an activity? When I am not busy, I am lonely."
)

story_list << Story.create!(
user_id: michael.id,
created_at: 858902400,
content: "Life outside me has become too new and strange and fast. The time will
come when I will be focused only on my bodily needs."
)

story_list << Story.create!(
  user_id: michael.id,
  created_at: 859420800,
  content: "Radio without Borders had an open discussion today on the relationship between children and elderly parents. This topic has kept me busy (seriously) for the past year. I have come so far that I say not only the children have to become independent from the parents, but also the parents from the children.

  For me this process was accompanied by much quiet heartsoreness and emotion
  and I had to work very hard at it. I gave my emotion and heartsoreness over to
  the most holy in myself and to the Holy of Holies, since I feel I can love the
  children more when I am not mad with heartsoreness or distracted by emotion.
  To me love is openness in every direction, and in respect of my children this
  is only possible if I expect nothing from them and blame them for nothing—then
  they will come to me out of love."
) 

story_list << Story.create!(
  user_id: daniel.id,
  created_at: 1307475918,
  title: "The War Zone Of Dementia",
  content: "The year was 2011, and a chilly November had just begun. Snow had mercifully held off until this morning, giving my family the window needed to carry out a task I wouldn't have believed possible, even a month earlier.
  My mother and I had been doing battle in the war zone of dementia for several years now. Together we'd colluded in the pretense that if we put enough strategies in place, Mom would be able to remain independent in her home.
  It wasn't to be, though. Most forms of dementia don't surrender to treatment or medication, much less reasoning or clever strategies. Dementia soldiers on, relentless, occupying new territory in the brain, changing the horizon, changing the culture, changing everything, until the existence that is, no longer resembles the existence that was.
  Mom and I had been going at this as though it were a battle we could win by determination and intelligence. My brother lived several hours away, but when he visited, he joined us in our delusion. In the past few months, though, I'd come to accept the truth. Mom's mental capacity had been invaded by a silent, formidable enemy. No rescue was going to come. Only support, in the form of…. me."
)

story_list << Story.create!(
  user_id: daniel.id,
  created_at: 1311536718,
  title: "Not Alone",
  content: "Often, I'd felt alone in my role as caregiver, but I knew I wasn't. People were praying. Week after week, month after month, I'd shared our deteriorating situation with my church and together we prayed. And prayed. And prayed. Until one day Mom had, of her own volition, decided it was time to move out of her house and into assisted living.
  Only the Lord could have changed her demented thought process to not only make this decision, but follow through on it.
  Yes, I helped her carry out all the tasks needed to find a residence of her choice, go through the leasing agreement, have a medical check-up, and plan the actual move. But it was God who kept her mind on track so she was able to move forward. My brother and I had no legal means to make decisions on Mom's behalf. Even in her demented state of mind, the law was clear.
  Mom was in charge of all her affairs.
  Looking back, it truly was a miracle."
)

story_list << Story.create!(
  user_id: daniel.id,
  created_at: 1312055118,
  title: "Words From Joshua",
  content: "On this particular day, I was reading in Joshua Chapter 1, and found myself in tears.
  Joshua was addressing the tribes God had allowed to settle on the far side of the Jordan River, away from where the battles would take place as the Jewish Nation moved in and took possession of the Promised Land. Joshua said to the tribes,
  \"You are to help them until the Lord gives them rest, as he has done for you, and until they too have taken possession of the land the Lord your God is giving them. After that, you may go back and occupy your own land.
  Joshua's words wrapped around my being like a protective hug. I opened my laptop to my journal."
)

story_list << Story.create!(
  user_id: daniel.id,
  created_at: 1320090318,
  content: "I have to admit, Lord, I'm still in a state of shock. It's hard to believe that after so many years supporting Mom to live independently in her own home, she's voluntarily made the move to a senior's residence.

Dementia is a relentless master, though. Even Mom recognized that. I remember the day I was visiting her and she suddenly stood up and fumed, \"Someone needs to write this down. This is happening in other people's brains. You need to write about this.\"  That's when I realized my journaling was doing exactly what she'd demanded – that there be a record of this period in her life when her brain was betraying her.

I've continued to journal as my brother and I have been drawn into this craziness. For a long time, Mom pulled Lawrence and me into her fantasy that things weren't as bad as they were, that we could maintain the illusion Mom's condition wouldn't deteriorate further. Still, her ability to care for herself and her house became more erratic, and pretending couldn't change that.  But since she never set up a power of attorney for us to make decisions on her behalf, all we could do was follow her lead, no matter how turbulent that was. Each crisis made it clear this couldn't last, but I had no idea how the change was going to be put in motion.

It still amazes me how the Lord managed to work everything out so Mom voluntarily made the move to assisted living. My prayer group at church sent up an ongoing barrage of requests to the Lord on Mom's behalf these past couple of years. I know Mom's not a believer, and neither is my brother, but God still moved in her life. He cleared Mom's mind enough for her to take the steps to apply to live at Whyte Hall, to understand that she was signing a rental agreement, to even be excited that the moving truck was coming to get the few things she needed to furnish her new apartment.  It took barely a month from start to finish, and the move was completed November 1st.

Lawrence is staying with her for a few days, sleeping on the floor in her little 1 bedroom apartment, to help her get used to the new routine. He'll drive the five hours back home at the end of the week. Then I'll take over.

He phoned me yesterday, though, and said it's appearing that we've simply changed one set of challenges for another.

Lord, I'm praying that you'll stay close as Mom goes through this transition. Her chapter of independent living has concluded. A new chapter is beginning."
)

story_list << Story.create!(
  user_id: daniel.id,
  created_at: 1320522318,
  title: "My brother, Lawrence leaves",
  content: "Today was a hard one for Mom. When I got to her apartment Lawrence was ready to explode. I walked through the door and she immediately started in on me.

\"The three of us have to go over to the bank right now. We have to talk to them about this.\"

\"What do we need to talk to them about?\" I asked. Lawrence, standing behind her, was rolling his eyes. I could see he'd been trying to get that information from her as well.

\"You'd better know what could come and with the mortgages and the university owns all that property,\" she explained, exasperated. \"If they decide to take the house, they just could you know.\"

I tried to make sense out of her confused rambling. I knew from experience there was some kind of logic behind her concern, but for the life of me, I couldn't find it.

\"The university doesn't own the house, Mom. You own it.\"

\"That's what you think, is it? Well, why don't we go over to the bank right now? I don't know what's wrong with you two.  Is Lawrence's brain squirrely now too?\"

\"Mom, I don't want to go over to the bank unless we understand what it is you want to talk to them about. And we'd need an appointment.\"

\"Appointment,\" she scoffed. \"You don't know how to do it. Get your coats. Where's my coat. We need to go now.\"

Lawrence slipped behind her to the little vestibule and put on his jacket. He held up his travel bag and waved a silent good-bye, hoping to slip out unnoticed. His few days of trying to help Mom get oriented had warranted no appreciation from her. I could tell that his altruistic motives had been exhausted.  I expected the five-hour drive home would be a welcome break after these past few days.

Mom glanced back and saw him leaving. I waved goodbye and he disappeared out the door.

\"What is he doing? Why is he running away like that?\"

\"It's time for him to go back up north,\" I explained. \"He's been here a week now. He's got to take care of his pets at the homestead.\"
"
)

story_list << Story.create!(
  user_id: daniel.id,
  created_at: 1330322318,
  title: "Best To Agree",
  content: "Explanations didn't help. I sat and listened to Mom's rambling for the next half hour, trying to decode what was in her mind. Her words kept shifting back to the bank, but I couldn't grasp what business she felt needed to be dealt with. It seemed she was worried about the economy and what might happen if it collapsed.

\"This happened before, you know,\" she fretted. \"Back in the '30s the banks just up and took properties. If they did it then they can do it now.\"

I'd learned by now that agreement was the best approach with dementia, so I tried to join her train of thought.

\"Yes, you're right, Mom. They did do it before and they could do it again. What do you think we should do about it now?\"

\"Nothing!\" she spat angrily. \"There's nothing you can do!\"

In a firm, calm tone, I took my stand. \"Well, if there's nothing we can do, then I'm not going to worry about something that hasn't happened. You've just said there's nothing we can do to prevent it. Talking to the bank won't change anything then.\"

Mom glared at me. She didn't seem pleased that I'd managed to turn her argument back on her. It did end the conversation, though, and I was relieved for that. Now we could move to the next task. The clock indicated lunch was to be served in twenty minutes. It was time to go down to the dining room."
)

story_list << Story.create!(
  user_id: daniel.id,
  created_at: 1333922318,
  title: "Heading To Dining Room",
  content: "Mom shook a bony wrist at me, waggling a red plastic curly cord that held her apartment keys, courtesy of the front desk. \"I have to wear this. Do you see this? It looks stupid. I have to take it everywhere!\"

\"You could put it in your purse,\" I suggested.

\"What do you know? It has to be here where they can see it!\"

Never one to break the rules, Mom seemed furious at the perceived concessions she had to make in this place. After forty years of living alone in her own home, with  no one but herself to tell her what to do, this new situation rankled.

I held my peace, though, recalling what the Lord had taught me some months ago. It was not my job to make Mom happy. Mine was to help her settle in. The rest was up to him. And her. I wondered if she'd be able to allow herself to get used to the changes. 2 Corinthians 10:5 came to mind. Such a thought was unproductive, so I quickly took it captive, making it obedient to Jesus, and let it go.

Besides. It was time for lunch. Locking her apartment door as we left was a struggle, though. Mom fumbled to find the keyhole. I wasn't sure if her vision was causing the problem, or if her stress was making it hard to focus. With coaching and a few careful nudges on my part, the key finally slipped in and was turned with a satisfying clunk.

Mom's apartment was at the end of the hall, furthest from the elevators. Others were emerging from their apartments and we joined the painstaking parade of seniors, many pushing walkers, a couple holding onto the railings which lined both sides of the hallway.

We joined the queue at the elevator and I smiled pleasantly at my mother's neighbours. A part of me realized I was working very hard to help her make a good impression; rather like a mother taking her child to her first day of school. It was patronizing on my part, but I couldn't stop myself. I wanted Mom to make friends, to be accepted.

\"That's where I have to wash clothes,\" Mom suddenly burst out. \"The garbage is in there.\"

I followed her accusatory finger pointing to a door labeled LAUNDRY. A couple of ladies looked at each other. I realized that those who were of sound mind had probably figured out Mom was struggling in that area. What did they think of having a new neighbour who had dementia?

The elevator arrived and we shuffled inside. Buttons as big as a soda cracker proclaimed the floor numbers. Everyone stood still for a few moments. Finally one gentleman huffed and pushed the button for Ground. After a very long pause the doors closed.

We were on our way to lunch."
)

story_list << Story.create!(
user_id: thu.id,
created_at: 1269287118,
title:
"My Story",
content: 
"I remember the day I was diagnosed in 2009, extremely well. I was astonished at being told I had this horrific disease. The room felt as if it was reeling and I experienced the sensation of being punched in my stomach.
How could this be? My family has no history of any form of Alzheimer's Disease. I thought I am too young I am only 47 at the time
I became angered, in denial and depressed at how my life would eventually turn out. Knowledge is the key to understanding this terrible disease and not giving up."
)

story_list << Story.create!(
user_id: thu.id,
created_at: 1269459918,
title:
"Oh My I Forgot what I was going to Post-Oh Yes Memory Loss",
content: 
"How many of you have memory problems? As a dementia patient sometimes it becomes so bad you just have to laugh at yourself. Here are some of mine.

I was going out to dinner with my best friend. He was outside waiting on me to come out, sometimes it could be a long wait.
I had lost my house keys and was tearing up the computer desk hunting for them. My body decided it had to go to the bathroom. Stubborn me decided my body had to wait, I had to find those stupid, hiding house keys.
Well my body disagreed with my mind and the next thing I know I felt a hot liquid going down my legs and covering my panties.
Here I stand with pee all over me and my clothes, no closer to finding the darn house keys and him blowing the stupid horn.
I thought what a lovely, exciting, peaceful night I was going to have.
I go into the bedroom all covered in pee. I jumped back in the shower, and tried to take a quick shower,well…it was not quick.
I forgot I had used all the shower gel last time I bathed, so all I had in the shower was conditioner and shampoo. I knew if I used the conditioner I would end up laying flat in the shower with my feet straight in the air, not a pretty sight for a fluffly full figured gal like me.
So shampoo it was, I happen to look down at the bottle as I was just about finished and low and behold it was dandruff shampoo.
Well i guess that took of all the dandruff on my body. At that moment the water turned to cold and I stood shivering with no dandruff to be seen on my body.
I jump out of the shower and slide on the rug, thankful I did not hit the toilet, as the lid was up. I would not be a pretty picture naked with my head in the toilet bowl.
I finally found clothes all but my panties. While looking I found small ones, smaller ones, and extra small ones, now these will barely come up over my knees now. The ones I need are the ones I could hang outside and the neighbors would swear it was a flag of surrender.
Finally found all my clothes including the extra size panties and dressed.
I grabbed my purse and ran out and looked the door. Then I realized I did not have my house keys. I looked down and guess where they were all the time? They were in the door knob where I unlocked the door earlier.
Now do not get the wrong idea this is not forgetful, this is me and my dementia brain at work."
)

story_list << Story.create!(
user_id: thu.id,
created_at: 1270151118,
title:
"Matters That Annoy You Now Diary of an Alzheimer's Patient",
content: 
"As an Alzheimer's patient I have noticed that matters that once did not bother me is now the driving force behind my annoyances. Patience in one of the personality changes that has happened to me; patience was something I once had but is now lost somewhere in my damaged brain. My lack of patience and waiting is like a finger nail on a chalk board to me now.
Once long ago I could shower, and be dressed in under ten minutes, now a days it takes longer. I start to hunt a piece of clothing and during this I have forgotten what I was searching for. This goes on for a length of time with each article of clothing. After arriving at your destination you're told your shirt is inside out and it is backward, now please tell me how in God's green earth can someone not notice this before I go in looking like a drunken, crazed, blind clown.
As I stated in the earlier post my hope is not being dressed and have a urine incontinence accident. Smelling of pee and hoping that you remembered to wash some clothes that you may change into. This is very annoying as I have to start back over from the beginning to dress.
Large crowds of people now irritate me, the loudness sounds like a high school band playing in my ears and the bands determined to stay till they run out of all songs they know. I would run screaming but I know that would just add to the band playing in my head and that would really drive me crazy.
Does anyone think the coffee pot is sluggish in making their coffee? Seems as if the beans had to harvested, roasted, ground and then brewed just to get one little cup of coffee. I decided it was the coffee maker so I went out and purchased a new one thinking alright now a fast cup of coffee. NOT, this one seems so much slower that the old one, I just can not win in getting a fast cup of coffee in the morning.
Shopping is a different matter, I may know I need the ingredients to make spaghetti, it takes many trips down aisles just getting the sauce, noodles, cheese and hamburger meat. I go down an aisle for something and then remember that I forgot something four aisles over. Remembering what's needed is time-consuming and by the time you finally get out of the store you're exhausted and disgusted.
I realize that everyone forgets things from time to time but this every single day that you either misplace, forget or totally lose any train of thought. Imagine this each day of your life, you wonder if it's really dementia or should I become committed with padded walls and people running naked down the halls.
Dementia is not a disease I would wish upon my worst enemy. Your memory is as if it's padlocked in a crate, you open one box and there's another box that it's locked again inside. This goes on until you get to the last small box that you imagine to hold your brain and when the last box is open all you find is a jack in the box, playing a silly tune that irritates you again."
)

story_list << Story.create!(
user_id: thu.id,
created_at: 1270496718,
title:
"What Day is Today?",
content: 
"Days of the Week

As an Alzheimer's patient I have a lot of trouble keeping up with the days of the week. I am always a day or two behind or a day or two ahead.

Better Way to Remember

Some how I wish I could find a better way to remember. I need to find a mode to remember the day of the week and what needs doing on this day. Maybe something that could tell me what's planned on each day. Any ideas on a program to help?

Forgotten Doctor Appointments
I have forgotten doctors appointments due to forgetting the exact day the appointment's scheduled. I have a calendar on the refrigerator, and small one next to the computer and yet I become confused. I guess I forget what I saw on the calendar a few minutes before, or it didn't register in my mind. Now the doctors call me the day before the appointment and an hour or two the day of the appointment.

Paying Bills
I have been late on paying bills simply because I forgot them or I didn't realize today was the day it was due. I have paid my share of late fees and reconnection fees, because of the short-term memory loss.
This past Friday I didn't realize the water was past due until later during the day I cut the water on, it's turned off. Monday I will have to pay the bill plus the reconnection fee. Instead of thirty-eight dollars, I will now have to pay seventy-three dollars, this was my fault for not paying . How I wish I could find a better way to remember. All the bills are together, and it's written on two calendars. Still I miss paying the bill on the day it's due."
)

story_list << Story.create!(
user_id: tom.id,
created_at: 959040000,
content: "When I was in the middle of ironing, Alan removed the plug from the socket and said I was not to continue. When I told him that I had only a few more items to iron, he said that he wouldn't allow it.
When I put the plug back in, he immediately took it out again. I didn't do this again, as I was a bit concerned that he may pick up the hot iron and burn me with it. He said that I knew I was in the wrong and asked why I didn't just admit it. He also mentioned that I had not paid to use the iron."
)

story_list << Story.create!(
user_id: tom.id,
created_at: 959731200,
content: "Alan became very agitated prior to setting out for our appointment. He thought someone was going to murder him. When we were in the car he said that it was me who was going to murder him. I told him that I loved him and asked him why I should want to murder him. He said he didn't know but that was how he felt."
)

story_list << Story.create!(user_id: tom.id,
created_at: 961113600,
content: "Alan got up before me and I went back to sleep. However, I was awakened by a pillow being pressed firmly over my head. I said, 'Stop it Alan, you're smothering me.' He said, 'That's what I'm trying to do. You've stolen my credit cards.' I soon managed to free myself and helped him look for the missing cards.
An hour later he was tearful and apologetic. However, later in the morning he was calling me 'scum' because he couldn't find his diary and assumed I had stolen it."
)

story_list << Story.create!(user_id: tom.id,
created_at: 963187200,
content: "Today was not a good day. Alan insisted that some folders I had in my hand were his and tried to grab them from me. He ended up pushing me, shoving me to the ground, slapping me and forcing me into the study. He then stood over me threateningly with his fingers digging into my arm. I made the mistake of biting his hand and he slapped me hard across the face twice.
He then started shouting to non-existent people in the house. While he was distracted I managed to scramble into the loo and lock the door. He kept banging at the door trying to get in. After about 15 minutes when all seemed quiet outside I came out. He then treated me as though nothing had happened and wondered why I had been crying."
)

story = Story.create!(user_id: tom.id,
created_at: 967766400,
content: "Aricept was prescribed again. (It was originally prescribed in June but Alan hid the tablets from me)."
)
story_list << story
Comment.create!(
  user_id: story.user_id,
  story_id: story.id,
  created_at: 967766400,
  content: "Alan shouldn't have hid them from you. Does he not want you to get better? I think if the doctor prescribed, then you should heed his medical advise. I wish you the best :)"
)

story_list.each {|story| persist_to_es(story)}
