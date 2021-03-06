# coding: utf-8
class Arrondissement < ActiveRecord::Base
  has_many :patinoires

  validates_presence_of :nom_arr, :source
  validates_presence_of :date_maj, if: ->(x){['donnees.ville.montreal.qc.ca', 'ville.dorval.qc.ca'].include? x.source}
  validates_uniqueness_of :nom_arr
  validates_uniqueness_of :cle, allow_blank: true

  validates_inclusion_of :nom_arr, in: [
    'Ahuntsic-Cartierville',
    'Anjou',
    'Côte-des-Neiges—Notre-Dame-de-Grâce',
    "L'Île-Bizard—Sainte-Geneviève",
    'LaSalle',
    'Lachine',
    'Le Plateau-Mont-Royal',
    'Le Sud-Ouest',
    'Mercier—Hochelaga-Maisonneuve',
    'Montréal-Nord',
    'Outremont',
    'Pierrefonds—Roxboro',
    'Rivière-des-Prairies—Pointe-aux-Trembles',
    'Rosemont—La Petite-Patrie',
    'Saint-Laurent',
    'Saint-Léonard',
    'Verdun',
    'Ville-Marie',
    'Villeray—Saint-Michel—Parc-Extension',

    # Municipalities
    "Baie-d'Urfé",
    'Beaconsfield',
    'Côte-Saint-Luc',
    'Dollard-des-Ormeaux',
    'Dorval',
    'Hampstead',
    'Kirkland',
    "L'Île-Dorval",
    'Montréal-Est',
    'Montréal-Ouest',
    'Mont-Royal',
    'Pointe-Claire',
    'Sainte-Anne-de-Bellevue',
    'Senneville',
    'Westmount',
  ]
  validates_inclusion_of :source, in: [
    'docs.google.com',
    'donnees.ville.montreal.qc.ca',
    'montreal-west.ca',
    'ville.dorval.qc.ca',
  ]

  scope :dynamic, where('date_maj IS NOT NULL')
end
