
import SwiftUI

struct GamePage: View {    
    @State var gameState = "Countdown"
    
    var countdown = [
        "3",
        "2",
        "1",
        "Mulai"
    ]
        
    @State var countdownState : Int = 0
    
    @State var navigateNext : Bool = false
    
    var guide = [
        "guide1",
        "guide2"
    ]
    
    @State var guideState : Int = 0
    
    var backgroundImage : String
    var body: some View {
        ZStack{
            ZStack {
                Image(backgroundImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.top)
                Image("ingame2")
                    .scaledToFit()
                    .offset(x : -10, y: 100)
                if(gameState == "Countdown") {
                    Color.black
                        .opacity(0.7)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(.black)
            .navigationBarBackButtonHidden()
            if(gameState == "Countdown") {
                ZStack {
                    Text(countdown[countdownState])
                        .font(.system(size: 72, weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 200)
                .background(.black.opacity(0.4))
                .offset(y: -30)
            } else {
                ZStack {
                    if(guideState == 1) {
                        HStack {
                            Image("guide-up")
                            Image("guide-obt")
                        }
                    }else {
                        VStack {
                            Image("guide-left")
                            Image("guide-right")
                        }
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 125)
                .background(.black.opacity(0.5))
                .offset(y: -300)
                .onTapGesture {
                    if(guideState == 0) {
                        guideState = guideState + 1
                    } else {
                        navigateNext = true
                    }
                }
            }
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if(countdownState < 3) {
                    countdownState = countdownState + 1
                }else{
                    gameState = "Start"
                }
            }
        }
        .navigationDestination(isPresented: $navigateNext) {
            ScorePage()
            Text("a")
                .hidden()
        }
    }

}

#Preview {
    GamePage(backgroundImage: "bg1")
}
