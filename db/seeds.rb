tag1 = Tag.create! name: 'Tag1'
tag2 = Tag.create! name: 'Tag2'
tag3 = Tag.create! name: 'Tag3'
tag4 = Tag.create! name: 'Tag4'
tag5 = Tag.create! name: 'Tag5'

FileUpload.create! name: 'File 1', tags: [tag1, tag2, tag3, tag5]
FileUpload.create! name: 'File 2', tags: [tag2]
FileUpload.create! name: 'File 3', tags: [tag2, tag3, tag5]
FileUpload.create! name: 'File 4', tags: [tag2, tag3, tag4, tag5]
FileUpload.create! name: 'File 5', tags: [tag3, tag4]