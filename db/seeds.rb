
# create courses and it's tutors
c1 = Course.create!(name: 'BCA', credits: 100, months_duration: 36)

c1.tutors.create!([
  {first_name: 'Alex', last_name: 'william', email: 'alex@gmail.com', mobile: '+911234567890', doj: Date.today},
  {first_name: 'John', last_name: 'cena', email: 'john@gmail.com', mobile: '+911234567899', doj: Date.today}
  ])

c2 = Course.create!(name: 'MCA', credits: 200, months_duration: 24)

c2.tutors.create!([
  {first_name: 'Jonny', last_name: 'cruise', email: 'jonny@gmail.com', mobile: '+911234567811', doj: Date.today},
  {first_name: 'Andrew', last_name: 'faris', email: 'andrew@gmail.com', mobile: '+911234567812', doj: Date.today}
  ])

Course.create!(name: 'BBA', credits: 100, months_duration: 36)
Course.create!(name: 'MBA', credits: 200, months_duration: 36)