import UIKit
import AVFoundation
import Alamofire

final class SpeakingViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    var recordButton: UIButton!
    var playButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupButtons()
        setupAudioRecorder()
    }

    func setupButtons() {
        recordButton = UIButton(frame: CGRect(x: (view.bounds.width - 100) / 2, y: (view.bounds.height - 100) / 2, width: 100, height: 50))
        recordButton.backgroundColor = .red
        recordButton.setTitle("Record", for: .normal)
        recordButton.addTarget(self, action: #selector(recordButtonTapped), for: .touchUpInside)
        view.addSubview(recordButton)

        playButton = UIButton(frame: CGRect(x: (view.bounds.width - 100) / 2, y: (view.bounds.height - 50) / 2 + 60, width: 100, height: 50))
        playButton.backgroundColor = .blue
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playButton.isEnabled = true // Assume there is something to play initially
        view.addSubview(playButton)
    }

    func setupAudioRecorder() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .default)
            try session.setActive(true)
            session.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.prepareRecorder()
                    } else {
                        print("Permission to record not granted")
                    }
                }
            }
        } catch {
            print("Failed to set up audio session.")
        }
    }

    func prepareRecorder() {
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("voiceMessage.m4a")

        let recordSettings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: recordSettings)
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        } catch {
            print("Failed to initialize audio recorder.")
        }
    }

    @objc func recordButtonTapped() {
        if let recorder = audioRecorder {
            if recorder.isRecording {
                recorder.stop()
                recordButton.setTitle("Record", for: .normal)
                recordButton.backgroundColor = .red
            } else {
                recorder.record()
                recordButton.setTitle("Stop", for: .normal)
                recordButton.backgroundColor = .green
            }
        }
    }

    @objc func playButtonTapped() {
        if let player = audioPlayer, player.isPlaying {
            player.stop()
            playButton.setTitle("Play", for: .normal)
        } else {
            playButton.setTitle("Loading...", for: .normal)
            fetchAndPlayAudioMessage()
        }
    }

    func fetchAndPlayAudioMessage() {
        APICaller.shared.getAudioMessage { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.playAudio(from: data)
                case .failure(let error):
                    print("Failed to fetch audio: \(error.localizedDescription)")
                    self?.playButton.setTitle("Play", for: .normal)
                }
            }
        }
    }

    private func playAudio(from data: Data) {
        do {
            audioPlayer = try AVAudioPlayer(data: data)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            playButton.setTitle("Stop", for: .normal)
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
            playButton.setTitle("Play", for: .normal)
        }
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("Recording was successful")
        } else {
            print("Recording failed")
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playButton.setTitle("Play", for: .normal)
    }
}
