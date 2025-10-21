/*:
 # Midterm Project
 ## Tyler Hager
 October 20, 2025
 */

import SwiftUI

let instruments = Bundle.main.decode([Subject].self, from: "Data.json")

struct InstrumentDetail: View {
    let instrument: Subject
    var body: some View {
        VStack {
            Text("Instrument Details")
            Image(instrument.imageName)
            Text(instrument.name).bold()
            Text(instrument.description)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(instruments) { instrument in
                    NavigationLink(destination: InstrumentDetail(instrument: instrument)) {
                        HStack {
                            Image(instrument.imageName).resizable().aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100)
                            Text(instrument.name)
                        }
                    }
                }
            }.navigationTitle("Tyler's instrument list")
        }
    }
}

#Preview {
    ContentView()
}
