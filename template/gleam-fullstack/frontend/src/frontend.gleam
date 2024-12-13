import lustre
import lustre/effect.{type Effect}
import sketch
import sketch/lustre as sketch_lustre
import sketch/lustre/element.{type Element}
import sketch/lustre/element/html
import sketch/size

pub fn main() {
  let assert Ok(cache) = sketch.cache(strategy: sketch.Ephemeral)
  sketch_lustre.node()
  |> sketch_lustre.compose(view, cache)
  |> lustre.application(init, update, _)
  |> lustre.start("#app", Nil)
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
  html.main(main_style(), [], [html.text("Hello, World!")])
}

fn main_style() {
  sketch.class([
    sketch.display("grid"),
    sketch.place_items("center"),
    sketch.height(size.vh(100)),
  ])
}
