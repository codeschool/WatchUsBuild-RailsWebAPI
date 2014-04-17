Genre.destroy_all

genre_attrs = [{
  name: 'Science Fiction'
},
{
  name: 'Fiction'
},
{
  name: 'Non-Fiction'
}]

Genre.create!(genre_attrs)

book_attrs = [{
  title: 'Mindstorms',
  author: 'Seymour A. Papert',
  review: 'Although this book focuses on the cognitive advantages to having children use technology from an early age, it is also an in depth look at how people can learn for themseves. As someone who was often distracted and bored at times during school, Mindstorms highlights some of the reasoning behind that feeling and what we can do as teachers to help minimize it.',
  rating: 5,
  amazon_id: '0465046746',
  genre: Genre.last
},
{
  title: 'Hyperion',
  author: 'Dan Simmons',
  review: "Probably my favorite science fiction book (and series) I've ever read. Hyperion is written in a style similar to The Canterbury Tales, in which a series of stories are told by the main characters. Each story is a gem in itself, but alude to the larger storyline. The scope of the story is ambitious - spanning time, planets religion and love.",
  rating: 5,
  amazon_id: '0553283685',
  genre: Genre.first
},
{
  title: "Jony Ive: The Genius Behind Apple's Greatest Products",
  author: 'Leander Kahney',
  review: "Even though I respect Ive, I felt this biography only hit skin deep. It went over all the major events in his life, his passion for design, awards he achieved -- but that's really it. I dont't feel I know him anymore than before reading this.",
  rating: 2,
  amazon_id: '159184617X',
  genre: Genre.last
}]

Book.create!(book_attrs);


