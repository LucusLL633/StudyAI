import Foundation
import UserNotifications

final class NotificationManager {
    static let shared = NotificationManager()
    private init() {}

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Erreur autorisation notifications : \(error)")
            }
        }
    }

    func scheduleDailyReminder(at time: Date) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        let content = UNMutableNotificationContent()
        content.title = "C'est l'heure d'étudier ! 📚"
        content.body = "Conservez votre streak et gagnez de l'XP en complétant votre objectif du jour."
        content.sound = .default

        let components = Calendar.current.dateComponents([.hour, .minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

        let request = UNNotificationRequest(identifier: "daily_study_reminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
