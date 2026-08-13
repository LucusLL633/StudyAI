import Foundation
import CloudKit

final class CloudSyncService {
    static let shared = CloudSyncService()
    private let container = CKContainer.default()
    private let privateDatabase = CKContainer.default().privateCloudDatabase

    private init() {}

    func syncUserData(user: User) async {
        let recordID = CKRecord.ID(recordName: user.id.uuidString)
        let record = CKRecord(recordType: "UserData", recordID: recordID)
        record["username"] = user.username as CKRecordValue
        record["level"] = user.level as CKRecordValue
        record["currentXP"] = user.currentXP as CKRecordValue
        record["currentStreak"] = user.currentStreak as CKRecordValue

        do {
            try await privateDatabase.save(record)
        } catch {
            print("Sync CloudKit silencieuse ou hors ligne : \(error)")
        }
    }
}
