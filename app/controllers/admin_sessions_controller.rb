class AdminSessionsController < ApplicationController
    # Action pour déconnecter l'administrateur
    def logout
      # Supprimer la session de l'administrateur
      session[:admin_id] = nil
      redirect_to root_path, notice: "Vous avez été déconnecté en tant qu'administrateur."
    end
  end
  