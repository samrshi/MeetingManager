//
//  NextMeetingView.swift
//  MeetingManager
//
//  Created by hawkeyeshi on 9/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct NextMeetingView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    @Binding var mainViewState: MainViewState
    @Binding var selectedMeetingID: UUID?
    
    let deleteMeetings: (RecurringMeetingModel?) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            if userInfo.settings.alwaysShowNextMeeting {
                Text("Next Meeting")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .transition(.opacity)
                
                if userInfo.nextMeeting != nil {
                    MeetingItemView(meeting: userInfo.nextMeeting!, mainViewState: $mainViewState, selectedMeetingID: $selectedMeetingID, show24HourTime: userInfo.settings.show24HourTime) {
                        self.deleteMeetings(self.userInfo.nextMeeting)
                    }
                } else {
                    Text("No more meetings today! 🎉")
                        .padding(.vertical)
                }
                
                Divider()
            }
        }
        .transition(.opacity)
    }
}