// Infinite Fuel: Mods > Infinite Fuel toggles it; the setting is remembered.
fn init() {
    this.on = config_get("on", false);
    // Physics runs on a worker and writes its tank states back each frame, overwriting a refill
    // made in frame(). Refill right after that write-back, before the next step copies the states.
    if !patch("KSA.Universe", "ApplyVehicleSolvers", "postfix", "refill") {
        print("inf_fuel: patch failed, refilling only while engines are off");
    }
}

fn menu() {
    if menu_item("Infinite Fuel", this.on) {
        this.on = !this.on;
        config_set("on", this.on);
    }
}

fn refill(universe, args) {
    if !this.on { return; }
    let v = ksa::Program::controlled_vehicle();
    if v != () { ksa::ResourceManager::refill_all_tanks(v.parts); }
}
