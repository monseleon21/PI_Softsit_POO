from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='Softsit_PI'
app.secret_key='mysecretkey'
mysql=MySQL(app)


@app.route('/')
def index():
    return render_template('pedidos_fundas.html')


#rura http:localhost:5000/guardar tipo POST para insert
@app.route('/guardar', methods=['GET','POST'])
def guardar():
  
  if request.method == 'POST':

    # pasamos a variables el contenido de los input
    VNombre=request.form['txtNombre']
    VApe_pa=request.form['txtApe_pa']
    VApe_ma=request.form['txtApe_ma']
    VMunicipio=request.form['txtMunicipio']
    VEstado=request.form['txtEstado']
    VColonia=request.form['txtColonia']
    VCalle=request.form['txtCalle']
    VDireccion=request.form['txtDireccion']
   
    #Conectar y ejecutar el insert
    cs= mysql.connection.cursor()
    cs.execute('insert into tbpedido_fundas (Nombre, Ape_pa, Ape_ma, Municipio, Estado, Colonia, Calle, Direccion) values (%s,%s,%s,%s,%s,%s,%s,%s)',(VNombre,VApe_pa,VApe_ma,VMunicipio,VEstado,VColonia,VCalle,VDireccion))
    mysql.connection.commit()

    flash('El pedido fue agregado exitosamente!')
    return redirect(url_for('index'))
  return render_template('menu.html')

@app.route ('/guardares', methods = ['GET','POST'])
def guardares ():
   if request.method == 'POST':
      
      VMarca = request.form ['txtMarca']
      VModelo = request.form ['txtModelo']

      cs = mysql.connection.cursor()
      cs.execute('Insert into tbespecificaciones (Marca, Modelo) values (%s,%s)',(VMarca,VModelo))
      mysql.connection.commit()

      flash('Las especificaciones se registraron correctamente!')
      return redirect(url_for('index'))

   @app.route('/opt', methods = ['POST'])
   def opt():
       return render_template('Menu.html')


if __name__ == '__main__':
    app.run(port=5000, debug=True)