import SwiftUI

// TODO: Set background color, drop shadow
// TODO: Set title of back button
struct DynamicTypeView: View {
    @Environment(\.dynamicTypeSize)
    private var dynamicTypeSize

    var body: some View {
        VStack {
            Text("hig.accessibility.dynamic-type.title")
                .font(.title)
            if !dynamicTypeSize.isAccessibilitySize {
                Text("hig.accessibility.dynamic-type.description")
                    .font(.body)
            }
        }
        .padding(.horizontal)
        NavigationStack {
            ScrollView {
                VStack {
                    SampleHeaderView()
                    Divider()
                    // TODO: Show a sample message
                    Text("Hello, World!")
                }
                .padding()
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "chevron.up")
                    }
                    Button {
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                    } label: {
                        Image(systemName: "trash")
                    }
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "folder")
                    }
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward")
                    }
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

private struct SampleHeaderView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    private let date: Date

    init(date: Date = .now) {
        self.date = date
    }

    var body: some View {
        AccessibleHStack(horizontalAlignment: .leading) {
            HStack {
                if !dynamicTypeSize.isAccessibilitySize {
                    Circle() // Instead of profile icon
                        .fill(Color.gray)
                        .frame(width: 40)
                }

                VStack(alignment: .leading) {
                    Text("sample.name.1")
                        .bold()
                        .truncationMode(.tail)
                        .lineLimit(1)
                    HStack {
                        Text("hig.accessibility.text.to") + Text(verbatim: ":")
                        Text("sample.name.2")
                            .foregroundStyle(.gray)
                            .truncationMode(.tail)
                            .lineLimit(1)
                        Text(Image(systemName: "chevron.forward"))
                            .foregroundStyle(.gray)
                    }
                }
            }
            if !dynamicTypeSize.isAccessibilitySize {
                Spacer()
            }
            AccessibleVStack(horizontalAlignment: .trailing) {
                Text(date, format: Date.FormatStyle(date: .numeric, time: .omitted))
                    .foregroundStyle(.gray)
                if dynamicTypeSize.isAccessibilitySize {
                    Spacer()
                }
                Image(systemName: "paperclip")
                    .foregroundStyle(.gray)
            }

        }
    }
}

// MARK: - Accessible Stacks

private struct AccessibleVStack<Content>: View where Content: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    private let horizontalAlignment: HorizontalAlignment

    private let content: Content

    init(
        horizontalAlignment: HorizontalAlignment,
        @ViewBuilder content: () -> Content
    ) {
        self.horizontalAlignment = horizontalAlignment
        self.content = content()
    }

    var body: some View {
        if dynamicTypeSize.isAccessibilitySize {
            HStack {
                content
            }
        } else {
            VStack(alignment: horizontalAlignment) {
                content
            }
        }
    }
}

private struct AccessibleHStack<Content>: View where Content: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    private let horizontalAlignment: HorizontalAlignment

    private let content: Content

    init(
        horizontalAlignment: HorizontalAlignment,
        @ViewBuilder content: () -> Content
    ) {
        self.horizontalAlignment = horizontalAlignment
        self.content = content()
    }

    var body: some View {
        if dynamicTypeSize.isAccessibilitySize {
            VStack(alignment: horizontalAlignment) {
                content
            }
        } else {
            HStack {
                content
            }
        }
    }
}

// MARK: - Xcode Preview

#Preview("DynamicTypeView(locale=enUS)") {
    DynamicTypeView()
        .environment(\.locale, .enUS)
        .environment(\.timeZone, .losAngeles)
}

#Preview("DynamicTypeView(locale=jaJP)") {
    DynamicTypeView()
        .environment(\.locale, .jaJP)
        .environment(\.timeZone, .tokyo)
}

#Preview("DynamicTypeView(dynamicTypeSize=xxxLarge)") {
    DynamicTypeView()
        .environment(\.dynamicTypeSize, .xxxLarge)
}

#Preview("DynamicTypeView(dynamicTypeSize=accessibility5)") {
    DynamicTypeView()
        .environment(\.dynamicTypeSize, .accessibility5)
}

#Preview("SampleHeaderView") {
    SampleHeaderView()
}
