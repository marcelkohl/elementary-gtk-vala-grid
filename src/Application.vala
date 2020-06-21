public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.marcelkohl.elementary-gtk-vala-grid",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
/*
        var grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.row_spacing = 6;

        var button = new Gtk.Button.with_label ("Click me!");
        var label = new Gtk.Label (null);

        grid.add (button);
        grid.add (label);

        button.clicked.connect (() => {
            label.label = "Hello World!";
            button.sensitive = false;
        });
*/
        var hello_button = new Gtk.Button.with_label ("Say Hello");
        var hello_label = new Gtk.Label (null);

        var rotate_button = new Gtk.Button.with_label ("Rotate");
        var rotate_label = new Gtk.Label ("Horizontal");

        var grid = new Gtk.Grid ();
        grid.column_spacing = 6;
        grid.row_spacing = 6;

        // add first row of widgets
        grid.attach (hello_button, 0, 0, 1, 1);
        grid.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);

        // add second row of widgets
        grid.attach (rotate_button, 0, 1);
        grid.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

        hello_button.clicked.connect (() => {
            hello_label.label = "Hello World!";
            hello_button.sensitive = false;
        });

        rotate_button.clicked.connect (() => {
            rotate_label.angle = 90;
            rotate_label.label = "Vertical";
            rotate_button.sensitive = false;
        });


        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 300;
        main_window.default_width = 300;
        main_window.title = "Grid";
        main_window.add (grid);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}
