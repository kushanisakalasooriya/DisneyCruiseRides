//
//  HomePageView.swift
//  SampleCoreData
//
//  Created by Kushani Sakalasooriya on 2023-06-13.
//

import SwiftUI

struct HomePageView: View {
   
    var imageArr : [String] = ["homepage-1","homepage-2","homepage-3"]
    
    @State private var isShowingShipDetails = false
    
    @State private var isShowingActivityDetails = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    imageSection
                    Divider()
                    Text("Where Magic Meets the Sea...")
                        .font(.title)
                    Text("Disney Cruise From the moment you step on board to your last wave goodbye, a Disney cruise includes almost everything you could hope for—larger-than-life entertainment, outstanding dining, spacious accommodations, dazzling destinations and more—with most experiences included in the price of your cruise.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }.navigationTitle("Disney Cruise")
                Divider()
                ShipsDetailsButton
                HStack{
                    Image("img-5")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                    Text("We’re celebrating 25 years of magical family vacations at sea across our entire fleet next summer. Come join the onboard festivities on sailings from May through September 2023.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
//                        .background(.mint)
                        .padding(.trailing)
                }
                Divider()
                Text("Can't Miss Experiences")
                    .font(.title)
                HStack{
                    Image("img-1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                    Image("img-4")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                }
                Divider()
                VStack{
                    
                    ActivityDetailsButton
                    Text("For assistance with your Disney Cruise, please call (800) 951-3532.")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .padding([.top, .leading, .trailing])
                    Text("Monday through Friday, 8:00 AM to 10:00 PM Eastern time; Saturday and Sunday, 9:00 AM to 8:00 PM Eastern time. Guests under 18 years of age must have parent or guardian permission to call.")
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .padding([.leading, .bottom, .trailing])
                    Text("                                                                              ")
                }
                
              
            }
        }
    }
    
    
    private var ShipsDetailsButton: some View {
        Button(action: {
            isShowingShipDetails = true
        }) {
            Text("Disney Cruise Ships")
                .font(.headline)
                .frame(width: 300, height: 35)
        }
        .buttonStyle(.borderedProminent)
        .sheet(isPresented: $isShowingShipDetails) {
            ShipDetailsView()
        }
    }
    
    private var ActivityDetailsButton: some View {
        Button(action: {
            isShowingActivityDetails = true
        }) {
            Text("Activities Overview")
                .font(.headline)
                .frame(width: 300, height: 35)
        }
        .buttonStyle(.borderedProminent)
        .sheet(isPresented: $isShowingActivityDetails) {
            ActivityDetailsView()
        }
    }
    
    private var imageSection : some View {
        TabView{
            ForEach(imageArr , id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
   
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

struct ShipDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Disney Cruise Line Ships.....").font(.largeTitle)
                VStack(alignment: .leading, spacing: 6){
                    VStack{
                        Text("Disney Magic")
                        HStack{
                            Image("ship1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                            Text("This classic-looking vessel awash with modern conveniences is home to the high-speed AquaDunk waterslide, splash zones for little ones, Rapunzel’s Royal Table restaurant, Fathoms and Keys nightclubs for adults, and imaginative clubs for kids, tweens and teens.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                        }
                        Text("Disney Wonder")
                        HStack{
                            Text("Boasting immersive storytelling touches at every turn, this impressive craft is celebrated for its notable onboard dining experiences like Palo and Tiana’s Place—and such can’t-miss entertainment options as Frozen, A Musical Spectacular and our Marvel Super Hero Academy for kids.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                            Image("ship2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                        }
                    }
                    VStack{
                        Text("Disney Dream")
                        HStack{
                            Image("ship3")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                            Text("Custom-built for magical moments, this ship will captivate your senses with its one-of-kind diversions, including our Broadway-caliber rendition of Beauty and the Beast, a kids’ play space themed after the Millennium Falcon in Star Wars and a mouthwatering selection of French-inspired cuisine at Remy.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                        }
                        Text("Disney Fantasy")
                        HStack{
                            Text("You’ll be delighted to find countless activities, eateries and entertainment to match any mood on a vessel designed with longer retreats in mind—standout features include the AquaDuck water coaster, the lavish Royal Court restaurant, an array of live shows and interactive play areas like Star Wars: Command Post.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                            Image("ship4")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton ,alignment: .topLeading)
        
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(15)
                .foregroundColor(.primary)
                .cornerRadius(10)
                .padding()
        }
    }
}


struct ActivityDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Disney Cruise Line Onboard Activities").font(.largeTitle)
                Text("Sit spellbound through Broadway-style musical live shows, be awed by a spectacular sky of fireworks, and watch first-run Disney movies.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing])
                
                VStack(alignment: .leading, spacing: 6){
                    VStack{
                        Text("ENTERTAINMENT")
                        HStack{
                            Image("activity1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                            Image("activity2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                        }
                        HStack{
                            Text("Behold true Disney magic, where original musicals, award-winning live productions and variety acts are performed throughout your voyage.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                            Text("Kids clubs, dining rooms and throughout the ship are just some of the places you’ll encounter popular Disney Characters.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                        }
                    }
                    VStack{
                        Text("DINING")
                        HStack{
                            Image("activity3")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                            Image("activity4")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                        }
                        HStack{
                            Text("Disney's Rotational Dining lets you rotate to one of 3 restaurants, while your servers follow you from venue to venue.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                            Text("Enjoy romantic dinner destinations that cater exclusively to adults looking for fine dining amid an elegant atmosphere.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                        }
                    }
                    VStack{
                        Text("JUST FOR YOU")
                        HStack{
                            Image("activity5")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                            Image("activity6")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                        }
                        HStack{
                            Text("Children 3 through 17 years of age can learn and play in larger-than-life play spaces fueled by Disney storytelling.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                            Text("Wherever in the world you sail, Disney ships boast onboard destinations to bring the family together in unforgettable ways.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                        }
                    }
                    VStack{
                        Text("RECREATION")
                        HStack{
                            Image("activity7")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                            Image("activity8")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                        }
                        HStack{
                            Text("Splash it up in freshwater pools, aqua play areas and waterslides designed for kids, families and adults.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                            Text("Treat yourself to spa therapies and magical makeovers in the world-class comfort of our salon and spas.")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .padding(.trailing)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton ,alignment: .topLeading)
        
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(15)
                .foregroundColor(.primary)
                .cornerRadius(10)
                .padding()
        }
    }
}





