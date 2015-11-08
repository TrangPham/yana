#!/bin/bash

source "common.sh"

curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "tim.id",
  "content": "During my going-away meeting with Gender Studies, the faculty gave me this journal. In it I’ll report my descent into the post-cerebral realm for which I am headed. No whimpering, no whining, no despair. Just the facts."
}
'

curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "tim.id",
  "content": "Saturday at the mall I performed the physical motions of shoplifting—walked out of Macy’s with a pair of pants over my arm. I only noticed when I was inside Dillard’s on the opposite side of the mall. I hurried back, ready to explain. There were no salespeople around, and no one noticed when I put them back." 
}
'

curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "michael.id",
  "content": "My heart does not come to rest."
}
'

curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "michael.id",
  "content": "I have started thinking seriously again that I have for years wanted to write an uncomplicated book without big words or much learning. Would I be able to do that? I will try. The least is that I will have a book to my name.  Most importantly, it will create! an activity here in my retirement center where I spend most of my time alone. In any other private house I would have been alone too."
}
'


curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "michael.id",
  "content": "In all my hobbies [painting, sketching, reading] I was well away when I became ill last year in early February; after my illness, however, I could not even write my name or write as I’m doing here now. What used to be everyday things had to come back gradually."
}
'

curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "michael.id",
  "content": "The society in which we and our children find ourselves provides for the care of children from when they’re small, adults work the whole day, old people are rightfully taken care of in retirement and old-age homes. However, what about the wherewithal of which loneliness snips the wings? Or those like me, who “struggle to keep busy,” if one can even call that an activity? When I am not busy, I am lonely."
}
'

curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "michael.id",
  "content": "Life outside me has become too new and strange and fast. The time will come when I will be focused only on my bodily needs."
}
'

curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "michael.id",
  "content": "Radio without Borders had an open discussion today on the relationship between children and elderly parents. This topic has kept me busy (seriously) for the past year. I have come so far that I say not only the children have to become independent from the parents, but also the parents from the children.  For me this process was accompanied by much quiet heartsoreness and emotion and I had to work very hard at it. I gave my emotion and heartsoreness over to the most holy in myself and to the Holy of Holies, since I feel I can love the children more when I am not mad with heartsoreness or distracted by emotion.  To me love is openness in every direction, and in respect of my children this is only possible if I expect nothing from them and blame them for nothing—then they will come to me out of love."
} 
'

curl -XPOST ${SERVER?}/${NAME?}/entry -d' {
  "user_id": "daniel.id",
  "title": "The War Zone Of Dementia.",
  "content": "The year was 2011, and a chilly November had just begun. Snow had mercifully held off until this morning, giving my family the window needed to carry out a task I wouldnt have believed possible, even a month earlier.  My mother and I had been doing battle in the war zone of dementia for several years now. Together wed colluded in the pretense that if we put enough strategies in place, Mom would be able to remain independent in her home.  It wasnt to be, though. Most forms of dementia dont surrender to treatment or medication, much less reasoning or clever strategies. Dementia soldiers on, relentless, occupying new territory in the brain, changing the horizon, changing the culture, changing everything, until the existence that is, no longer resembles the existence that was.  Mom and I had been going at this as though it were a battle we could win by determination and intelligence. My brother lived several hours away, but when he visited, he joined us in our delusion. In the past few months, though, Id come to accept the truth. Moms mental capacity had been invaded by a silent, formidable enemy. No rescue was going to come. Only support, in the form of…. me."
}
'

