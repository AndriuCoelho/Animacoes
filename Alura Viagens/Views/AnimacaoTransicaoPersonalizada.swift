//
//  AnimacaoTransicaoPersonalizada.swift
//  Alura Viagens
//
//  Created by Alura on 19/01/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class AnimacaoTransicaoPersonalizada: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Atributos
    
    private var duracao: TimeInterval
    private var imagem: UIImage
    private var frameInicial: CGRect
    
    // MARK: - Inicializador
    
    init(duracao: TimeInterval, imagem: UIImage, frameInicial: CGRect) {
        self.duracao = duracao
        self.imagem = imagem
        self.frameInicial = frameInicial
    }
    
    // MARK: - Metodos
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duracao
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let viewFinal = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        let imagemDaViagem = viewFinal.viewWithTag(1) as? UIImageView
        imagemDaViagem?.image = imagem
        
        let imagemDeTransicao = UIImageView(frame: frameInicial)
        imagemDeTransicao.image = imagem
        
        let contexto = transitionContext.containerView
        contexto.addSubview(imagemDeTransicao)
    }
}
