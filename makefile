SWIFTCFLAGS=-I/usr/include/gtk-3.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/pango-1.0 -I/usr/include/cairo \
						-I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/atk-1.0

all:
	swift build --clean
	swift build $(addprefix -Xcc ,${SWIFTCFLAGS})
