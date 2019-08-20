import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    // MARK: UIViewRepresentable
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIView {
        let view = UIView(frame: .zero)
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        
        view.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ view: UIView, context: UIViewRepresentableContext<ActivityIndicator>) {}
    
}
