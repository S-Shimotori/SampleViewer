import SwiftUI

struct InterfaceIconView: View {
    private var layoutDirectionContexts = [
        LayoutDirectionContext(
            id: UUID(),
            layoutDirection: .leftToRight,
            description: "hig.right-to-left.interface.variant.ltr.description"
        ),
        LayoutDirectionContext(
            id: UUID(),
            layoutDirection: .rightToLeft,
            description: "hig.right-to-left.interface.variant.rtl.description"
        ),
    ]

    private var localeContexts = [
        LocaleContext(
            id: UUID(),
            locale: .enUS,
            description: "locale.en_US"
        ),
        LocaleContext(
            id: UUID(),
            locale: .heIL,
            description: "locale.he_IL"
        ),
        LocaleContext(
            id: UUID(),
            locale: .arAE,
            description: "locale.ar_AE"
        ),
    ]

    var body: some View {
        NavigationStack {
            Text("hig.right-to-left.interface.description")
                .font(.body)
            .padding()
            ScrollView {
                Section("hig.right-to-left.interface.directional.title") {
                    ForEach(layoutDirectionContexts) { layoutDirectionContexts in
                        GroupBox {
                            HStack {
                                Image(systemName: "list.bullet")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                                Image(systemName: "book.closed")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                                Image(systemName: "macwindow")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                                Image(systemName: "battery.25percent")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                            }
                        } label: {
                            Text(layoutDirectionContexts.description)
                        }
                    }
                }

                Section("hig.right-to-left.interface.text.title") {
                    ForEach(layoutDirectionContexts) { layoutDirectionContexts in
                        GroupBox {
                            HStack {
                                Image(systemName: "text.page")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                            }
                        } label: {
                            Text(layoutDirectionContexts.description)
                        }
                    }
                }

                Section("hig.right-to-left.interface.localized.title") {
                    ForEach(localeContexts) { localeContext in
                        GroupBox {
                            HStack {
                                Image(systemName: "signature")
                                Image(systemName: "richtext.page")
                                Image(systemName: "character.cursor.ibeam")
                            }
                            .environment(\.locale, localeContext.locale)
                        } label: {
                            Text(localeContext.description)
                        }
                    }

                    NavigationLink(
                        destination: LanguageSpecificSFSymbolView()
                    ) {
                        Text("button.seemore")
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                }

                Section("hig.right-to-left.interface.motion.title") {
                    ForEach(layoutDirectionContexts) { layoutDirectionContexts in
                        GroupBox {
                            HStack {
                                Image(systemName: "speaker.wave.3.fill")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                            }
                        } label: {
                            Text(layoutDirectionContexts.description)
                        }
                    }
                }

                Section("hig.right-to-left.interface.backslash.title") {
                    ForEach(layoutDirectionContexts) { layoutDirectionContexts in
                        GroupBox {
                            HStack {
                                Image(systemName: "speaker.slash.fill")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                            }
                        } label: {
                            Text(layoutDirectionContexts.description)
                        }
                    }
                }

                Section("hig.right-to-left.interface.component.title") {
                    ForEach(layoutDirectionContexts) { layoutDirectionContexts in
                        GroupBox {
                            HStack {
                                Image(systemName: "cart.fill.badge.plus")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                            }
                        } label: {
                            Text(layoutDirectionContexts.description)
                        }
                    }
                }

                Section("hig.right-to-left.interface.tool.title") {
                    ForEach(layoutDirectionContexts) { layoutDirectionContexts in
                        GroupBox {
                            HStack {
                                Image(systemName: "mail.and.text.magnifyingglass")
                                    .environment(\.layoutDirection, layoutDirectionContexts.layoutDirection)
                            }
                        } label: {
                            Text(layoutDirectionContexts.description)
                        }
                    }
                }
            }
            .padding()
            .navigationBarTitle(
                "hig.right-to-left.interface.title",
                displayMode: .inline
            )
        }
    }
}

// MARK: - Context

private struct LayoutDirectionContext: Identifiable {
    var id: UUID
    var layoutDirection: LayoutDirection
    var description: LocalizedStringKey
}

private struct LocaleContext: Identifiable {
    var id: UUID
    var locale: Locale
    var description: LocalizedStringKey
}

// MARK: - Xcode Preview

#Preview("InterfaceIconView(locale=enUS)") {
    InterfaceIconView()
        .environment(\.locale, .enUS)
}

#Preview("InterfaceIconView(locale=jaJP)") {
    InterfaceIconView()
        .environment(\.locale, .jaJP)
}
