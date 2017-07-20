require 'sinatra'
require 'i18n'
require 'better_errors' if development?


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

# Configuracion
configure do
  I18n.enforce_available_locales = false
  I18n.load_path = Dir[File.join(settings.root, 'locales', '*.yml')]
  set :port => 3006
  set :bind => 0000
end

before '/:locale/*' do
  I18n.locale = params[:locale]
end

before '/' do
  I18n.locale = :es
end

before '/:locale' do
  I18n.locale = params[:locale]
end

# Filtros para el idioma
before '/:locale/*' do
  I18n.locale = (params[:locale].eql?('es') || params[:locale].eql?('en')) ? params[:locale] : :es
end

configure do
  set :show_exceptions, false
# set :show_exceptions, :after_handler
end


#===========================
#      GLOBALES
#===========================

get '/' do
  @titulo = ""
  erb (I18n.locale.to_s + '/vistas/index').to_sym, :layout => ("/layouts/layout_index").to_sym
end

get '/en' do
  @tituloEn = ""
  erb (I18n.locale.to_s + '/vistas/index').to_sym, :layout => ("/layouts/layout_index").to_sym
end

get '/es' do
  erb (I18n.locale.to_s + '/vistas/index').to_sym, :layout => ("/layouts/layout_index").to_sym
end


#===========================
#      QUIENES SOMOS
#===========================
get '/:locale/mision-vision' do
  @titulo = 'Misión y Visión'
  @tituloEn = 'Misión y Visión'
  erb :"#{I18n.locale}/vistas/nosotros/mision-vision", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/directorio-gerencia' do
  @titulo = 'Directorio y Gerencia'
  @tituloEn = 'Directorio y Gerencia'
  erb :"#{I18n.locale}/vistas/nosotros/directorio-gerencia", :layout => ('layouts/layout_interior').to_sym
  end

get '/:locale/historia' do
  @titulo = 'Historia'
  @tituloEn = 'Historia'
  erb :"#{I18n.locale}/vistas/nosotros/historia", :layout => ('layouts/layout_interior').to_sym
  end

get '/:locale/resultados' do
  @titulo = 'Resultados'
  @tituloEn = 'Resultados'
  erb :"#{I18n.locale}/vistas/nosotros/resultados", :layout => ('layouts/layout_interior').to_sym
  end

get '/:locale/propiedades-mineras' do
  @titulo = 'Propiedades Mineras'
  @tituloEn = 'Propiedades Mineras'
  erb :"#{I18n.locale}/vistas/nosotros/propiedades-mineras", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/politica-ssomac' do
  @titulo = 'Política SSOMAC'
  @tituloEn = 'Política SSOMAC'
  erb :"#{I18n.locale}/vistas/nosotros/politica-ssomac", :layout => ('layouts/layout_interior').to_sym
end


#===========================
#        OPERACIONES
#===========================
get '/:locale/reservas-recursos' do
  @titulo = 'Reservas y Recursos Minerales'
  @tituloEn = 'Reservas y Recursos Minerales'
  erb :"#{I18n.locale}/vistas/operaciones/reservas-recursos", :layout => ('layouts/layout_interior').to_sym
  end

get '/:locale/unidades-mineras' do
  @titulo = 'Unidades Mineras'
  @tituloEn = 'Unidades Mineras'
  erb :"#{I18n.locale}/vistas/operaciones/unidades-mineras", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/energia' do
  @titulo = 'Energía'
  @tituloEn = 'Energía'
  erb :"#{I18n.locale}/vistas/operaciones/energia", :layout => ('layouts/layout_interior').to_sym
  end


#===========================
#        CRECIMIENTO
#===========================
get '/:locale/estrategia-crecimiento' do
  @titulo = 'Estrategia de Crecimiento'
  @tituloEn = 'Estrategia de Crecimiento'
  erb :"#{I18n.locale}/vistas/crecimiento/estrategia-crecimiento", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/proyectos-exploracion' do
  @titulo = 'Proyectos de Exploración'
  @tituloEn = 'Proyectos de Exploración'
  erb :"#{I18n.locale}/vistas/crecimiento/proyectos-exploracion", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/proyectos-energia' do
  @titulo = 'Proyectos de Energía'
  @tituloEn = 'Proyectos de Energía'
  erb :"#{I18n.locale}/vistas/crecimiento/proyectos-energia", :layout => ('layouts/layout_interior').to_sym
end


#===========================
#    ASUNTOS CORPORATIVOS
#===========================
get '/:locale/seguridad-salud' do
  @titulo = 'Seguridad y Salud'
  @tituloEn = 'Seguridad y Salud'
  erb :"#{I18n.locale}/vistas/asuntos/seguridad-salud", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/gestion-humana' do
  @titulo = 'Gestión Humana'
  @tituloEn = 'Gestión Humana'
  erb :"#{I18n.locale}/vistas/asuntos/gestion-humana", :layout => ('layouts/layout_interior').to_sym
  end

get '/:locale/responsabilidad-social' do
  @titulo = 'Responsabilidad Social'
  @tituloEn = 'Responsabilidad Social'
  erb :"#{I18n.locale}/vistas/asuntos/responsabilidad-social", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/medio-ambiente' do
  @titulo = 'Medio Ambiente'
  @tituloEn = 'Medio Ambiente'
  erb :"#{I18n.locale}/vistas/asuntos/medio-ambiente", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/obras-impuestos' do
  @titulo = 'Obras por Impuestos'
  @tituloEn = 'Obras por Impuestos'
  erb :"#{I18n.locale}/vistas/asuntos/obras-impuestos", :layout => ('layouts/layout_interior').to_sym
end

#===========================
#      INVERSIONISTAS
#===========================
get '/:locale/memoria-anual' do
  @titulo = 'Memoria Anual'
  @tituloEn = 'Memoria Anual'
  erb :"#{I18n.locale}/vistas/inversionistas/memoria-anual", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/reporte-sostenibilidad' do
  @titulo = 'Reporte de Sostenibilidad'
  @tituloEn = 'Reporte de Sostenibilidad'
  erb :"#{I18n.locale}/vistas/inversionistas/reporte-sostenibilidad", :layout => ('layouts/layout_interior').to_sym
  end

get '/:locale/estados-financieros' do
  @titulo = 'Estados Financieros'
  @tituloEn = 'Estados Financieros'
  erb :"#{I18n.locale}/vistas/inversionistas/estados-financieros", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/analisis-gerencia' do
  @titulo = 'Análisis de Gerencia'
  @tituloEn = 'Análisis de Gerencia'
  erb :"#{I18n.locale}/vistas/inversionistas/analisis-gerencia", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/presentaciones-corporativas' do
  @titulo = 'Presentacione Corporativas'
  @tituloEn = 'Presentacione Corporativas'
  erb :"#{I18n.locale}/vistas/inversionistas/presentaciones-corporativas", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/notas-prensa' do
  @titulo = 'Notas de Prensa'
  @tituloEn = 'Notas de Prensa'
  erb :"#{I18n.locale}/vistas/inversionistas/notas-prensa", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/proteccion-accionista' do
  @titulo = 'Protección al Accionista Minoritario'
  @tituloEn = 'Protección al Accionista Minoritario'
  erb :"#{I18n.locale}/vistas/inversionistas/proteccion-accionista", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/derecho-accionistas' do
  @titulo = 'Derecho de los Accionistas'
  @tituloEn = 'Derecho de los Accionistas'
  erb :"#{I18n.locale}/vistas/inversionistas/derecho-accionistas", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/links-interes' do
  @titulo = 'Links de Interés'
  @tituloEn = 'Links de Interés'
  erb :"#{I18n.locale}/vistas/inversionistas/links-interes", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/contactar-inversionistas' do
  @titulo = 'Contactar a Relaciones con Inversionistas'
  @tituloEn = 'Contactar a Relaciones con Inversionistas'
  erb :"#{I18n.locale}/vistas/inversionistas/contactar-inversionistas", :layout => ('layouts/layout_interior').to_sym
  end

#===========================
#   TRABAJA CON NOSOTROS
#===========================
get '/:locale/uno-de-nosotros' do
  @titulo = 'Sé Uno de Nosotros'
  @tituloEn = 'Sé Uno de Nosotros'
  erb :"#{I18n.locale}/vistas/trabaja/uno-de-nosotros", :layout => ('layouts/layout_interior').to_sym
end

get '/:locale/oportunidades-laborales' do
  @titulo = 'Oportunidades Laborales'
  @tituloEn = 'Oportunidades Laborales'
  erb :"#{I18n.locale}/vistas/trabaja/oportunidades-laborales", :layout => ('layouts/layout_interior').to_sym
end



not_found do
  status 404
  @titulo = "Página no encontrada"
  @tituloEn = "Page not found"

  erb :"#{I18n.locale}/vistas/Independientes/pagina404", :layout => ('layouts/layout_interior').to_sym
end
#
#/* HELPERS */
helpers do
  def change_language
    if request.path_info=="/"
      return "/en"

    elsif I18n.locale == :es
      return request.path_info.sub('es', 'en')

    elsif I18n.locale == :en
      return request.path_info.sub('en', 'es')

    end
  end

end

#===========================
#           CORREO
#===========================
post '/es/mailcontacto' do
  require 'pony'

  from = "contacto@creal.com"
  subject = "Suscripción boletín de Creal"

  Pony.mail(
      :from => from,
      :to => 'lovera@irstrat.com',
      :subject => subject,
      :headers => {'Content-Type' => 'text/html'},
      :body => erb(:"/es/vistas/Independientes/mail"),
      :via => :smtp,
      :via_options => {
          :address => 'smtp.mailgun.org',
          :port => '587',
          :enable_starttls_auto => true,
          :user_name => 'postmaster@sandbox37424.mailgun.org',
          :password => '7pl8f5goquf8',
          :authentication => :plain,
          :domain => "irstrat.com"
      })
  redirect '/'
end
