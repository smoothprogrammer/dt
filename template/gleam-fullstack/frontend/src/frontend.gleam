import lustre
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/ui/alert.{alert}
import lustre/ui/theme

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
}

type Model =
  Int

fn init(_) -> #(Model, Effect(Msg)) {
  #(0, effect.none())
}

pub type Msg

fn update(_model: Model, _msg: Msg) -> #(Model, Effect(Msg)) {
  #(0, effect.none())
}

fn view(_model: Model) -> Element(Msg) {
  theme.inject(theme.default(), fn() {
    alert([alert.success()], [html.text("Hello, World!")])
  })
}
