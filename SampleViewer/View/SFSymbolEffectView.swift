import SwiftUI

struct SFSymbolEffectView: View {
    @State private var isOn: Bool = false

    var body: some View {
        VStack {
            Text("hig.sf-symbols.animations.title")
                .font(.title)
            Text("hig.sf-symbols.animations.description")
                .font(.body)
            Toggle("hig.sf-symbols.animations.toggle.title", isOn: $isOn)
        }
        .padding()

        ScrollView {
            GroupBox("hig.sf-symbols.animations.appear.description") {
                HStack {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .symbolEffect(.appear, isActive: !isOn)
                    Image(systemName: "photo.stack")
                        .transition(.symbolEffect(.appear))
                        .symbolEffect(.appear, isActive: !isOn)
                    Image(systemName: "waveform")
                        .transition(.symbolEffect(.appear))
                        .symbolEffect(.appear, isActive: !isOn)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.disappear.description") {
                HStack {
                    Image(systemName: "folder.badge.plus")
                        .symbolEffect(.disappear, isActive: isOn)
                    Image(systemName: "lightbulb.2")
                        .symbolEffect(.disappear, isActive: isOn)
                    Image(systemName: "bubble.left.and.bubble.right")
                        .symbolEffect(.disappear, isActive: isOn)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.bounce.description") {
                HStack {
                    Image(systemName: "music.note.list")
                        .symbolEffect(.bounce)
                    // TODO: Add "HAHA" symbol
                    Image(systemName: "livephoto")
                        .symbolEffect(.bounce)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.scale.description") {
                HStack {
                    Image(systemName: "pip.exit")
                        .symbolEffect(.scale.up, isActive: isOn)
                    Image(systemName: "square.3.layers.3d")
                        .symbolEffect(.scale.up, isActive: isOn)
                    Image(systemName: "homepod.and.homepod.mini.fill")
                        .symbolEffect(.scale.up, isActive: isOn)
                        .symbolRenderingMode(.monochrome)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.pulse.description") {
                HStack {
                    Image(systemName: "airplay.video")
                        .symbolRenderingMode(.hierarchical)
                        .symbolEffect(.pulse)
                    // TODO: Add "waveform + bubble + pause" symbol
                    Image(systemName: "inset.filled.rectangle.and.person.filled")
                        .symbolEffect(.pulse)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.variableColor.description") {
                HStack {
                    Image(systemName: "speaker.wave.3.fill")
                        .symbolEffect(.variableColor)
                    Image(systemName: "wifi")
                        .symbolEffect(.variableColor)
                    Image(systemName: "sprinkler.and.droplets.fill")
                        .symbolEffect(.variableColor)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.replace.description") {
                HStack {
                    Image(systemName: isOn ? "list.bullet" : "square.grid.2x2")
                        .contentTransition(.symbolEffect(.replace.downUp))
                    Image(systemName: isOn ? "cloud.sun.fill" : "cloud.rain.fill")
                        .contentTransition(.symbolEffect(.replace.upUp))
                    Image(systemName: isOn ? "multiply.circle.fill": "microphone.fill")
                        .contentTransition(.symbolEffect(.replace.offUp))
                        .symbolRenderingMode(isOn ? .hierarchical : .monochrome)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.magic.description") {
                HStack {
                    Image(systemName: isOn ? "creditcard.trianglebadge.exclamationmark" : "creditcard")
                        .contentTransition(.symbolEffect(.replace.magic(fallback: .downUp)))
                    Image(systemName: isOn ? "microphone.slash" : "microphone")
                        .contentTransition(.symbolEffect(.replace.magic(fallback: .downUp)))
                    Image(systemName: isOn ? "person.crop.circle.badge.xmark" : "person.crop.circle.badge.checkmark")
                        .contentTransition(.symbolEffect(.replace.magic(fallback: .downUp)))
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.wiggle.description") {
                HStack {
                    Image(systemName: "digitalcrown.horizontal.press")
                        .symbolEffect(.wiggle)
                    // FIXME: Enable "photo.on.rectangle.angled" symbol to wiggle animation
                    Image(systemName: "photo.on.rectangle.angled")
                        .symbolEffect(.wiggle)
                    Image(systemName: "car.top.lane.dashed.arrowtriangle.inward")
                        .symbolEffect(.wiggle)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.breathe.description") {
                HStack {
                    Image(systemName: "waveform")
                        .symbolEffect(.breathe)
                    Image(systemName: "translate")
                        .symbolEffect(.breathe)
                    Image(systemName: "livephoto")
                        .symbolEffect(.breathe)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }

            GroupBox("hig.sf-symbols.animations.rotate.description") {
                HStack {
                    // FIXME: Enable "gear" symbol to wiggle animation
                    Image(systemName: "gear")
                        .symbolEffect(.rotate, value: isOn)
                    // FIXME: Enable "fan.desk" symbol to wiggle animation
                    Image(systemName: "fan.desk")
                        .symbolEffect(.rotate, isActive: isOn)
                    // TODO: Add a symbol like solar system
                }
                .frame(maxWidth: .infinity, minHeight: 40)
            }
        }
        .padding()
    }
}

// MARK: - Xcode Preview

#Preview("SFSymbolEffectView(locale=enUS)") {
    SFSymbolEffectView()
        .environment(\.locale, .enUS)
}

#Preview("SFSymbolEffectView(locale=jaJP)") {
    SFSymbolEffectView()
        .environment(\.locale, .jaJP)
}
