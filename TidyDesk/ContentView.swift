//
//  ContentView.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTab: Tab = .clean
    @Environment(\.colorScheme) private var scheme
    @State private var isDark: Bool = true
    @State private var hoverTab: Tab?
    @State private var onApeared: Bool = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            HStack(spacing: 0) {
                let isLarge = size.width > (screenFrame.width * 0.5)
                
                ViewThatFits{
                    SideBar(size)
                    
                    ScrollView(.vertical) {
                        SideBar(size)
                    }
                    .scrollIndicators(.hidden)
                    
                }
                .background(scheme == .dark ? .black : .white)
                .clipShape(.rect( cornerRadius: isLarge ? 12 : 50, style: .continuous))
                .padding(15)
                .animation(onApeared ? .snappy(duration: 0.28) : .none, value: isLarge)
                .task {
                    guard !onApeared else { return }
                    try? await Task.sleep(for: .seconds(0.1))
                    onApeared = true
                }

                // CustomTabView(selection: $currentTab) {
                //     ForEach(Tab.allCases, id: \.rawValue) { tab in
                //         Text(tab.rawValue + "Views")
                //             .tag(tab)
                //     }
                // }
                CustomTabView(selection: $currentTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        if tab == .clean {
                            DragAndDropView()
                                .tag(tab)
                        } else {
                            Text(tab.rawValue + "Views")
                                .tag(tab)
                        }
                    }
                }
            }
            .frame(width: size.width, height: size.height, alignment: .leading)
        }
        .background()
        .preferredColorScheme(isDark ? .dark : .light)
    }
    
    ///SideBar
    @ViewBuilder
    func SideBar(_ size: CGSize) -> some View {
        let isLarge = size.width > (screenFrame.width * 0.5)
        
        VStack(alignment: isLarge ? .leading : .center, spacing: 0, content: {
            
            HStack(spacing: isLarge ? 10: 0) {
                Image(systemName: "envelope.fill")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(width: 30, height: 30)
                    .background(.blue.gradient, in: .circle)
                
                if isLarge {
                    Text("TidyDesk")
                        .fontWeight(.medium)
                }
            }
            .padding(.bottom, 12)


            
            ForEach(Tab.allCases, id: \.rawValue){ tab in
                
                Button(action: {currentTab = tab}, label: {
                    HStack(spacing: isLarge ? 8: 0) {
                        Image(systemName: tab.sfSymbol)
                        .font(.title2)
                        .fontWeight(currentTab == tab ? .semibold : .regular)
                        .foregroundStyle(currentTab == tab ? Color.primary : .gray)
                        .frame(width: 30, height: 30)
                        
                        if isLarge {
                            Text(tab.rawValue)
                                .frame(width: 55, alignment: .leading)
                        }
                    }
                    .contentShape(.rect)
                })
                .padding(.vertical, 7)
                .onContinuousHover(perform: { phase in
                    hoverTab = (phase == .ended ? nil: tab)
                })
                .scaleEffect(hoverTab == tab ? 1.1 : 1)
            }
            
            Spacer(minLength: 0)
            
            ///Dark mode
            Button(action: {
                isDark.toggle()
            }, label: {
                
                HStack(spacing: isLarge ? 6: 0) {
                    if #available(macOS 14, *) {
                        Image(systemName: !isDark ? "moon" : "sun.min")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primary)
                        .frame(width: 30, height: 30)
                        .contentTransition(.symbolEffect(.replace))

                    }else {
                        Image(systemName: !isDark ? "moon" : "sun.min")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primary)
                        .frame(width: 30, height: 30)
                    }
                    if isLarge {
                        Text(isDark ? "Light" : "Dark")
                    }
                }
                .contentShape(.rect)
                .foregroundStyle(Color.primary)
            })
        })
        .animation(.snappy(duration: 0.28), value: currentTab)        
        .animation(.snappy(duration: 0.28), value: hoverTab)
        .buttonStyle(.plain)
        .padding(15)
        
    }
    
    var screenFrame: CGRect {
        return NSScreen.main?.visibleFrame ?? .zero
    }
}

//#Preview {
//    ContentView()
//}
