# OTMPickerDemo

This is a bare-bones demonstration of a particular data use-case that I run into all the time: present a UI
to allow a user to establish a one-to-many relationship between data elements. Here's an example: wire up an
extended family tree, with lots of people living in different households and having different relationships
among themselves (parent/child, partner, housemate). Any one person may have any number of housemates, but
the list of potential housemates may not include themselves.

I've run into trouble using various approaches in SwiftUI. `NavigationLink`, `sheet()`, `ZStack` - each offers some opportunity and each fails in different and confusing ways.
